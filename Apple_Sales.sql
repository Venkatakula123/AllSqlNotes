DO $$ 
DECLARE
    i INT;
    product_names TEXT[] := ARRAY['iPhone 14', 'iPhone 14 Pro', 'MacBook Air M2', 'MacBook Pro 14"', 'Apple Watch Series 9', 'iPad Pro 12.9"', 'AirPods Pro 2', 'iMac 24"', 'Apple TV 4K', 'HomePod Mini'];
    store_locations TEXT[] := ARRAY['New York, NY', 'Los Angeles, CA', 'Chicago, IL', 'Miami, FL', 'San Francisco, CA', 'Seattle, WA', 'Austin, TX', 'Boston, MA', 'Denver, CO', 'Dallas, TX'];
    store_names TEXT[] := ARRAY['Apple Store NY', 'Apple Store LA', 'Apple Store IL', 'Apple Store FL', 'Apple Store SF', 'Apple Store WA', 'Apple Store TX', 'Apple Store MA', 'Apple Store CO', 'Apple Store TX'];
    salespersons TEXT[] := ARRAY['John Doe', 'Jane Smith', 'Mike Johnson', 'Sarah Brown', 'Chris Green', 'Emily White', 'Robert Black', 'Megan Hall', 'Lisa Gray', 'Paul Harris'];
    customer_ids TEXT[] := ARRAY['C001', 'C002', 'C003', 'C004', 'C005', 'C006', 'C007', 'C008', 'C009', 'C010'];

BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO apple_sales (product_name, product_id, sale_date, quantity, unit_price, total_price, store_location, store_name, salesperson, customer_id, total_sales)
        VALUES (
            product_names[FLOOR(1 + RANDOM() * 9) + 1],
            FLOOR(101 + RANDOM() * 9 + 1),
            CURRENT_DATE - INTERVAL '1 day' * FLOOR(RANDOM() * 30 + 1),
            FLOOR(RANDOM() * 5 + 1),
            ROUND((RANDOM() * 1500 + 200)::NUMERIC, 2),
            ROUND((RANDOM() * 1500 + 200)::NUMERIC, 2) * FLOOR(RANDOM() * 5 + 1),
            store_locations[FLOOR(1 + RANDOM() * 9) + 1],
            store_names[FLOOR(1 + RANDOM() * 9) + 1],
            salespersons[FLOOR(1 + RANDOM() * 9) + 1],
            customer_ids[FLOOR(1 + RANDOM() * 9) + 1],
            ROUND((RANDOM() * 20000 + 1000)::NUMERIC, 2)
        );
    END LOOP;
END $$;
