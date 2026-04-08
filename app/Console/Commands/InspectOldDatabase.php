<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class InspectOldDatabase extends Command
{
    protected $signature = 'app:inspect-old-db
                            {--connection=old_addmagpro : Database connection name}
                            {--table= : Inspect a specific table}';

    protected $description = 'Inspect the old addmagpro.com database schema — lists all tables and their columns';

    public function handle(): int
    {
        $connection = $this->option('connection');

        try {
            $db = DB::connection($connection);
            $db->getPdo(); // test connection
        } catch (\Exception $e) {
            $this->error("Cannot connect to '{$connection}': " . $e->getMessage());
            $this->newLine();
            $this->warn('Make sure these env vars are set in your .env file:');
            $this->line('  OLD_DB_HOST=your_host');
            $this->line('  OLD_DB_PORT=3306');
            $this->line('  OLD_DB_DATABASE=your_database');
            $this->line('  OLD_DB_USERNAME=your_username');
            $this->line('  OLD_DB_PASSWORD=your_password');
            return self::FAILURE;
        }

        $dbName = $db->getDatabaseName();
        $this->info("Connected to database: {$dbName}");
        $this->newLine();

        $specificTable = $this->option('table');

        if ($specificTable) {
            $this->inspectTable($db, $dbName, $specificTable);
            return self::SUCCESS;
        }

        // Get all tables
        $tables = $db->select('SELECT TABLE_NAME, TABLE_ROWS, DATA_LENGTH, CREATE_TIME
                               FROM information_schema.TABLES
                               WHERE TABLE_SCHEMA = ?
                               ORDER BY TABLE_NAME', [$dbName]);

        if (empty($tables)) {
            $this->warn('No tables found in database.');
            return self::SUCCESS;
        }

        $this->info(count($tables) . ' tables found:');
        $this->newLine();

        $tableData = [];
        foreach ($tables as $table) {
            $tableName = $table->TABLE_NAME;
            $rowCount = $table->TABLE_ROWS ?? 0;
            $sizeMb = round(($table->DATA_LENGTH ?? 0) / 1024 / 1024, 2);

            $columns = $db->select('SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY, EXTRA
                                    FROM information_schema.COLUMNS
                                    WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ?
                                    ORDER BY ORDINAL_POSITION', [$dbName, $tableName]);

            $columnNames = collect($columns)->pluck('COLUMN_NAME')->implode(', ');

            $tableData[] = [
                $tableName,
                $rowCount,
                $sizeMb . ' MB',
                count($columns) . ' cols',
            ];
        }

        $this->table(['Table', 'Rows (approx)', 'Size', 'Columns'], $tableData);
        $this->newLine();

        // Detailed column listing for each table
        if ($this->confirm('Show detailed column info for all tables?', true)) {
            foreach ($tables as $table) {
                $this->inspectTable($db, $dbName, $table->TABLE_NAME);
            }
        }

        return self::SUCCESS;
    }

    private function inspectTable($db, string $dbName, string $tableName): void
    {
        $columns = $db->select('SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY, COLUMN_DEFAULT, EXTRA
                                FROM information_schema.COLUMNS
                                WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ?
                                ORDER BY ORDINAL_POSITION', [$dbName, $tableName]);

        if (empty($columns)) {
            $this->warn("Table '{$tableName}' not found.");
            return;
        }

        $this->info("── {$tableName} (" . count($columns) . " columns) ──");

        $columnData = [];
        foreach ($columns as $col) {
            $flags = [];
            if ($col->COLUMN_KEY === 'PRI') $flags[] = 'PK';
            if ($col->COLUMN_KEY === 'UNI') $flags[] = 'UNIQUE';
            if ($col->COLUMN_KEY === 'MUL') $flags[] = 'INDEX';
            if (str_contains($col->EXTRA, 'auto_increment')) $flags[] = 'AI';
            if ($col->IS_NULLABLE === 'YES') $flags[] = 'NULL';

            $columnData[] = [
                $col->COLUMN_NAME,
                $col->COLUMN_TYPE,
                implode(', ', $flags),
                $col->COLUMN_DEFAULT ?? '',
            ];
        }

        $this->table(['Column', 'Type', 'Flags', 'Default'], $columnData);
        $this->newLine();
    }
}
