USE adlister_db;

INSERT INTO users (username, email, password)
VALUES ('admin', 'admin@admin.com', 'password');

INSERT INTO categories (title) VALUE ('test');

INSERT INTO tags (category_id, title) VALUES (1, 'other');

INSERT INTO ads (user_id, tag_id, title, description, posted_date)
VALUES (1, 1, 'Holy Grail', 'Decorated cup with historical significance', '2019-10-20'),
       (1, 1, 'The Kracken', 'Looking for a loving home', '2019-10-20'),
       (1, 1, 'The Moon', 'Taking any offer. No deliveries', '2019-10-20'),
       (1, 1, 'Not a flamethrower', 'I promise it is not a flamethrower', '2019-10-20'),
       (1, 1, 'Schrodinger''s Cat', 'Live cat will be shipped. Should be considered both alive and dead until package is received.', '2019-10-20'),
       (1, 1, 'Hitman', 'Really good at hitting baseballs.', '2019-10-20'),
       (1, 1, 'Uranium-238', '10 grams of enriched uranium-238. If delivery takes longer than 4.5 billion years, expect 5 grams', '2019-10-20'),
       (1, 1, 'Police Call Box', 'Old style, blue police phone booth. Surprisingly roomy on the inside.', '2019-10-20'),
       (1, 1, '2013 Toyota Tacoma', 'Registered to Brance Alexander. If interested contact Mitchell Arnold.', '2019-10-20'),
       (1, 1, 'Horse', 'It''s literally just a horse.', '2019-10-20'),
       (1, 1, 'Black Lotus', 'The perfect card for any MTG player that values winning more than friendship or their bank account.', '2019-10-20'),
       (1, 1, 'Location of Elvis Presley', 'GPS coordinates in exchange for cash.', '2019-10-20'),
       (1, 1, 'Duck', 'Perfect partner for coding.', '2019-10-20'),
       (1, 1, 'AyePhone', 'A pirated version of Apple''s smartphone.', '2019-10-20'),
       (1, 1, 'Beanie Babies', 'The 90''s promised that these would be worth money by now', '2019-10-20'),
       (1, 1, 'Baker needed', 'My son''s birthday is coming up and I want a special cake baked for him. I need someone who can bake a file into a cake because my son is a tool collector. Any flavor of cake and icing is fine. Decorations would be nice but are not required. Deliver to Texas State Penitentiary.', '2019-10-20'),
       (1, 1, 'Yes man needed', 'I need someone to follow me around and agree with everything I say. Pay is minimal and work conditions are demeaning.', '2019-10-20'),
       (1, 1, 'Batman needs city to protect', 'Don''t worry about what happened to Gotham. It will be better this time.', '2019-10-20'),
       (1, 1, 'Found dog', 'Looking for the owner of a dog found on the north side of San Antonio. Cannot tell the breed but he''s about 6.5 feet long and around 600 pounds. Seems to be fond of salmon and sleeping during winter.', '2019-10-20'),
       (1, 1, 'Compliments', 'You are a nice person.', '2019-10-20');