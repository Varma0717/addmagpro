<?php

/**
 * Legacy SQL Import Preparation Script
 *
 * Reads addmagpr_addmagpro.sql and outputs legacy_import.sql with all table names
 * prefixed with 'legacy_' to avoid collisions with existing Laravel tables.
 *
 * Usage: php database/scripts/prepare_legacy_import.php
 */

$inputFile  = __DIR__ . '/../../addmagpr_addmagpro.sql';
$outputFile = __DIR__ . '/../../database/scripts/legacy_import.sql';

if (!file_exists($inputFile)) {
    echo "ERROR: Input file not found: {$inputFile}\n";
    exit(1);
}

echo "Reading {$inputFile}...\n";
$sql = file_get_contents($inputFile);

// Remove CREATE DATABASE / USE statements
$sql = preg_replace('/^CREATE DATABASE.*?;\s*$/mi', '', $sql);
$sql = preg_replace('/^USE\s+`[^`]+`\s*;\s*$/mi', '', $sql);

// Get all table names from CREATE TABLE statements
preg_match_all('/CREATE TABLE(?: IF NOT EXISTS)?\s+`([^`]+)`/i', $sql, $matches);
$tables = array_unique($matches[1]);

echo "Found " . count($tables) . " tables to prefix:\n";

// Sort tables by name length DESC to avoid partial replacements
// e.g., 'users_commission_wallets' before 'users'
usort($tables, function ($a, $b) {
    return strlen($b) - strlen($a);
});

foreach ($tables as $table) {
    $legacy = 'legacy_' . $table;
    echo "  {$table} -> {$legacy}\n";

    // Replace backtick-quoted table references
    $sql = str_replace("`{$table}`", "`{$legacy}`", $sql);
}

// Write output
$dir = dirname($outputFile);
if (!is_dir($dir)) {
    mkdir($dir, 0755, true);
}

file_put_contents($outputFile, $sql);
$sizeMB = round(strlen($sql) / 1024 / 1024, 2);
echo "\nOutput written to: {$outputFile} ({$sizeMB} MB)\n";
echo "Upload this file to Hostinger phpMyAdmin to import legacy data.\n";
