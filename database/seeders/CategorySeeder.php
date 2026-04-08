<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class CategorySeeder extends Seeder
{
    public function run(): void
    {
        // ── Top-level e-commerce categories ──
        $ecommerce = [
            ['name' => 'Groceries',          'icon' => '🛒', 'sort_order' => 1],
            ['name' => 'Electronics',        'icon' => '📱', 'sort_order' => 2],
            ['name' => 'Fashion',            'icon' => '👗', 'sort_order' => 3],
            ['name' => 'Home & Living',      'icon' => '🏠', 'sort_order' => 4],
            ['name' => 'Health & Beauty',    'icon' => '💊', 'sort_order' => 5],
            ['name' => 'Sports & Fitness',   'icon' => '🏋️', 'sort_order' => 6],
            ['name' => 'Nutrition Health',   'icon' => '🥗', 'sort_order' => 7],
            ['name' => 'BIOENERGY',          'icon' => '🔋', 'sort_order' => 8],
            ['name' => 'Personal Care',      'icon' => '🧴', 'sort_order' => 9],
            ['name' => 'Men Fashion',        'icon' => '👔', 'sort_order' => 10],
            ['name' => 'Books',              'icon' => '📚', 'sort_order' => 11],
            ['name' => 'Furniture',          'icon' => '🛋️', 'sort_order' => 12],
            ['name' => 'Shoes',              'icon' => '👟', 'sort_order' => 13],
            ['name' => 'Electric Vehicles',  'icon' => '🔌', 'sort_order' => 14],
            ['name' => 'Stationery',         'icon' => '✏️', 'sort_order' => 15],
        ];

        // ── Top-level service categories ──
        $services = [
            ['name' => 'Real Estate',        'icon' => '🏢', 'sort_order' => 1],
            ['name' => 'Jobs',               'icon' => '💼', 'sort_order' => 2],
            ['name' => 'Repairs',            'icon' => '🔧', 'sort_order' => 3],
            ['name' => 'PG / Hostel',        'icon' => '🛏️', 'sort_order' => 4],
            ['name' => 'Gym & Fitness',      'icon' => '💪', 'sort_order' => 5],
            ['name' => 'Loans',              'icon' => '💰', 'sort_order' => 6],
            ['name' => 'Education',          'icon' => '🎓', 'sort_order' => 7],
            ['name' => 'Ads & Classifieds',  'icon' => '📢', 'sort_order' => 8],
            ['name' => 'Life Insurance',     'icon' => '🛡️', 'sort_order' => 9],
            ['name' => 'Care Health',        'icon' => '❤️', 'sort_order' => 10],
            ['name' => 'Discount Vendors',   'icon' => '🏷️', 'sort_order' => 11],
        ];

        foreach ($ecommerce as $cat) {
            Category::updateOrCreate(
                ['slug' => Str::slug($cat['name'])],
                ['name' => $cat['name'], 'icon' => $cat['icon'], 'type' => 'ecommerce', 'is_active' => true, 'sort_order' => $cat['sort_order']]
            );
        }

        foreach ($services as $cat) {
            Category::updateOrCreate(
                ['slug' => Str::slug($cat['name'])],
                ['name' => $cat['name'], 'icon' => $cat['icon'], 'type' => 'service', 'is_active' => true, 'sort_order' => $cat['sort_order']]
            );
        }

        // ── Stores (subcategories under "Stores" parent) ──
        $storesParent = Category::updateOrCreate(
            ['slug' => 'stores'],
            ['name' => 'Stores', 'icon' => '🏪', 'type' => 'service', 'is_active' => true, 'sort_order' => 12]
        );

        $stores = [
            'Air Coolers', 'Air Ticketing', 'Automobiles', 'Ayurvedic Store', 'Bakery',
            'Bangle Store', 'Bar & Restaurant', 'Battery Shop', 'Beauty Parlour', 'Banquet Hall',
            'Boutique', 'Bus Bookings', 'Car Decors', 'Car Wash', 'Care Centers',
            'Chit Fund', 'Clothe Store', 'Coaching Center', 'Colleges', 'DJ Sounds',
            'Driving School', 'Dry Cleaners', 'Dry Fruits Shop', 'DTH', 'Earth Movers',
            'Electricals', 'Fertiliser', 'Flex Printing', 'Flour Mill', 'Flower Shop',
            'Footwear', 'Furniture Shop', 'Gems & Pearls', 'Gift Shop', 'Glass Mart',
            'Gold Shop', 'Granite', 'Gym Centers', 'Home Decors', 'Hardware Shop',
            'Hospital', 'Hotel', 'Interiors', 'Jewellery', 'Kirana General',
            'Kitchen Gallery', 'Lodge', 'Marble Store', 'Marriage Bureau', 'Mechanic Shop',
            'Medical Store', 'Mess', 'Mosquito Nets', 'Novelty Store', 'Old Furniture',
            'Old Age Homes', 'Opticals', 'Paints Shop', 'Pan Shop', 'Pet Shops',
            'Photo Frames', 'Plywood Shop', 'Pooja Store', 'Resorts', 'Sanitary Shop',
            'Schools', 'Solar Systems', 'Sports Shop', 'Super Market', 'Surgicals',
            'Sweet Shop', 'Tent House', 'Tiffin Centre', 'Tours & Travels', 'Trust & Charity',
            'Tyre Retreader', 'Watch Shop', 'Wheel Alignment', 'Wholesale Shops', 'Yoga Centre',
        ];

        foreach ($stores as $i => $name) {
            Category::updateOrCreate(
                ['slug' => Str::slug($name)],
                [
                    'name'       => $name,
                    'parent_id'  => $storesParent->id,
                    'type'       => 'service',
                    'is_active'  => true,
                    'sort_order' => $i + 1,
                ]
            );
        }

        // ── Services directory (subcategories under "Services Directory" parent) ──
        $servicesParent = Category::updateOrCreate(
            ['slug' => 'services-directory'],
            ['name' => 'Services Directory', 'icon' => '🔧', 'type' => 'service', 'is_active' => true, 'sort_order' => 13]
        );

        $servicesList = [
            'Abroad Consultant', 'AC Service', 'Accountant', 'Ad Agency', 'Advocate',
            'Aerobics', 'AI Services', 'Ambulance', 'Animal Transporter', 'Apparel Manufacturer',
            'Architecture', 'Astrologers', 'Auditors', 'Beauty Services', 'Bike Repair',
            'Bodyguards', 'Borewell', 'Bridal Makeup', 'Building Leakages', 'Car AC',
            'Car Decors', 'Car Hire', 'Car Repair', 'Car Wash', 'Carpenters',
            'Catering', 'CCTV Camera', 'Chartered Accountant', 'Chef', 'Civil Contractors',
            'Civil Engineer', 'Cleaning Services', 'Computer Hardware Training', 'Computer Networking Training', 'Computer Training',
            'Cookware', 'Counselling Centre', 'Courier Services', 'Dance Classes', 'Database Training',
            'Detectives', 'Diagnostic', 'Document Writer', 'Dr Acupuncture', 'Dr Ayurvedic',
            'Dr Dentist', 'Dr Dermatologists', 'Dr Naturopathy', 'Dr Homeopathy', 'Drawing Classes',
            'Drivers', 'Electricians', 'Engineering Services', 'Event Organizer', 'Fabricators',
            'False Ceiling', 'Farmlands', 'Fashion Designing', 'Financial Advisor', 'Flats',
            'Flooring Contractors', 'Florist', 'Furniture Contractors', 'Furniture Repair', 'Gardeners',
            'Gas Stove Repair', 'Graphic Designer', 'GST', 'Gym Centre', 'Gym Coach',
            'Hobbies & Collections', 'Home Loans', 'House Keeping', 'Insurance Advisor', 'Interior Designers',
            'Jewellery Services', 'Labour Service', 'LIC Agent', 'Life Coaching', 'Lift Service',
            'Loans Service', 'Lock Repair', 'Maggam Works', 'Magician', 'Maids',
            'Marketing', 'Martial Arts', 'Mechanic', 'Medical', 'Mehandi',
            'Mobile Repair', 'Multimedia', 'Music Classes', 'Networker MLM', 'Notary',
            'Numerologist', 'Nursing Services', 'Nutrition', 'Organic Natural', 'Packers & Movers',
            'Painters', 'PAN Aadhar Service', 'PC & Laptop Repair', 'Personal Loans', 'Pest Control',
            'Photographer', 'Physiotherapy', 'Placement Services', 'Plots', 'Plumber',
            'Postal Agent', 'Printing', 'Purohit', 'Real Estate Service', 'Refrigeration',
            'Registration Consultants', 'Rehabilitation', 'Reporter', 'Rock Drills', 'Salons',
            'Scrap Buyers', 'Screen Printer', 'Security Services', 'Septic Tank Cleaner', 'Share Consultancy',
            'Social Worker', 'Stamp Vendor', 'Stone Crusher', 'Surveyor', 'Tailor',
            'Tax Consultant', 'Transporters', 'Tuitions', 'TV Repair', 'Valuers',
            'Vastu', 'Vehicle Transporters', 'Videographer', 'Villa', 'Vision Board',
            'Vocational Training', 'Washing Machine Repair', 'Water Tanker', 'Web Technology Training', 'Website Designers',
            'Wedding Decors', 'Yoga Teacher',
        ];

        foreach ($servicesList as $i => $name) {
            Category::updateOrCreate(
                ['slug' => Str::slug($name)],
                [
                    'name'       => $name,
                    'parent_id'  => $servicesParent->id,
                    'type'       => 'service',
                    'is_active'  => true,
                    'sort_order' => $i + 1,
                ]
            );
        }

        $totalStores = count($stores);
        $totalServices = count($servicesList);
        $this->command->info("Seeded {$totalStores} store subcategories + {$totalServices} service subcategories.");
    }
}
