-- database name: "db_restaurant"

CREATE TABLE category
(
    category_id     uuid PRIMARY KEY,
    category_name   VARCHAR(255) NOT NULL,
    category_active BOOLEAN      NOT NULL DEFAULT True,
    category_src    VARCHAR(255) NOT NULL
);

CREATE TABLE food
(
    food_id       uuid PRIMARY KEY,
    food_name     VARCHAR(255) NOT NULL,
    food_star     VARCHAR(255) NOT NULL default '0',
    food_vote     INT NOT NULL DEFAULT 0,
    food_price    INT NOT NULL,
    food_discount INT NOT NULL,
    food_desc     VARCHAR(255) NOT NULL default '',
    food_status   VARCHAR(255) NOT NULL default 'normal',
    category_id   uuid NOT NULL,
    food_src      VARCHAR(255) NOT NULL
);


CREATE TABLE "user"
(
    user_id       SERIAL PRIMARY KEY,
    user_name     VARCHAR(255),
    user_email    VARCHAR(255),
    user_phone    VARCHAR(255),
    user_password VARCHAR(255),
    user_birth    VARCHAR(255),
    user_gender   VARCHAR(255)
);

CREATE TABLE cart
(
    user_id  INT,
    food_id  INT,
    item_qty INT,
    PRIMARY KEY (user_id, food_id)
);

CREATE TABLE booktable
(
    book_id     SERIAL PRIMARY KEY,
    book_name   VARCHAR(255),
    book_phone  VARCHAR(255),
    book_people INT,
    book_tables INT,
    user_id     INT,
    book_when   VARCHAR(255),
    book_note   TEXT
);

CREATE TABLE billdetails
(
    bill_id  INT,
    food_id  INT,
    item_qty INT,
    PRIMARY KEY (bill_id, food_id)
);

CREATE TABLE billstatus
(
    bill_id       INT,
    user_id       INT,
    bill_phone    VARCHAR(255),
    bill_address  TEXT,
    bill_when     VARCHAR(255),
    bill_method   VARCHAR(255),
    bill_discount INT,
    bill_delivery INT,
    bill_total    INT,
    bill_paid     VARCHAR(255),
    bill_status   INT,
    PRIMARY KEY (bill_id)
);


INSERT INTO food (food_name, food_star, food_vote, food_price, food_discount, food_desc, food_status, food_type,
                  category_id, food_src)
VALUES ('carne asada tacos', '4.5', '999', '12.00', '0.00', '03 pieces per serving', 'best seller', 'meat', 1,
        'taco/taco-1.png'),
       ('shrimp tacos', '4.5', '999', '15.00', '3.00', '03 pieces per serving', 'best seller', 'meat', 1,
        'taco/taco-2.png'),
       ('barbacoa tacos', '4.5', '500', '12.00', '0.00', '03 pieces per serving', 'best seller', 'meat', 1,
        'taco/taco-3.png'),
       ('tacos al pastor', '4.5', '999', '13.00', '2.00', '03 pieces per serving', 'best seller', 'meat', 1,
        'taco/taco-4.png'),
       ('tinga tacos', '4', '500', '11.00', '0.00', '03 pieces per serving', 'normal', 'meat', 1,
        'taco/taco-5.png'),
       ('campechanos tacos', '4', '500', '11.00', '1.00', '03 pieces per serving', 'new dishes', 'meat', 1,
        'taco/taco-6.png'),
       ('carnitas tacos', '4.5', '500', '14.00', '2.00', '03 pieces per serving', 'seasonal dishes online only', 'meat',
        1, 'taco/taco-7.png'),
       ('vegan tacos', '4.5', '100', '9.00', '2.00', '03 pieces per serving', 'new dishes', 'vegan', 1,
        'taco/taco-8.png'),
       ('wet burrito', '4.5', '600', '14.00', '0.00', '01 roll per serving', 'new dishes', 'meat', 2,
        'burrito/burrito-1.png'),
       ('poncho burrito', '4.5', '999', '15.00', '3.00', '01 roll per serving', 'best seller', 'meat', 2,
        'burrito/burrito-2.png'),
       ('bean & cheese burrito', '4.5', '999', '14.00', '0.00', '01 roll per serving', 'best seller', 'vegan',
        2, 'burrito/burrito-3.png'),
       ('breakfast burrito', '4.5', '999', '12.00', '2.00', '01 roll per serving', 'new dishes', 'meat', 2,
        'burrito/burrito-4.png'),
       ('california burrito', '4.5', '999', '14.00', '0.00', '01 roll per serving', 'best seller', 'meat', 2,
        'burrito/burrito-5.png'),
       ('chimichanga', '4', '400', '12.00', '2.00', '01 roll per serving', 'seasonal dishes', 'meat', 2,
        'burrito/burrito-6.png'),
       ('nacho tots', '4', '699', '12.00', '2.00', '01 tray per serving', 'best seller', 'meat', 3,
        'nachos/nachos-1.png'),
       ('root beer pork nachos', '4.5', '999', '12.00', '0.00', '01 tray per serving', 'best seller', 'meat', 3,
        'nachos/nachos-2.png'),
       ('shrimp nachos', '4.5', '999', '17.00', '2.00', '01 tray per serving', 'best seller', 'meat', 3,
        'nachos/nachos-3.png'),
       ('chicken nachos', '4.5', '999', '11.00', '0.00', '01 tray per serving', 'best seller', 'meat', 3,
        'nachos/nachos-4.png'),
       ('only nachos', '4', '999', '7.00', '2.00', '01 tray per serving', 'normal', 'vegan', 3,
        'nachos/nachos-5.png'),
       ('pico de gallo', '4.5', '999', '5.00', '2.00', '01 bowl per serving', 'best seller', 'vegan', 3,
        'nachos/salsa-1.png'),
       ('salsa guille', '4', '699', '5.00', '2.00', '01 bowl per serving', 'best seller', 'vegan', 3,
        'nachos/salsa-2.png'),
       ('tomatillo salsa', '4.5', '499', '5.00', '2.00', '01 bowl per serving', 'seasonal dishes', 'vegan', 3,
        'nachos/salsa-3.png'),
       ('roasted tomato salsa', '4.5', '999', '5.00', '2.00', '01 bowl per serving', 'best seller', 'vegan', 3,
        'nachos/salsa-4.png'),
       ('guacamole', '4.5', '699', '5.00', '2.00', '01 bowl per serving', 'best seller', 'vegan', 3,
        'nachos/salsa-5.png'),
       ('corn salad', '3.5', '699', '5.00', '1.00', '01 bowl per serving', 'new dishes seasonal dishes', 'vegan',
        4, 'side/side-1.png'),
       ('keto taquitos', '4.5', '999', '9.00', '0.00', '05 pieces per serving', 'best seller', 'meat', 4,
        'side/side-2.png'),
       ('mexican rice', '4', '200', '5.00', '0.00', '01 bowl per serving', 'normal', 'vegan', 4,
        'side/side-3.png'),
       ('cilantro lime rice', '4', '100', '5.00', '0.00', '01 bowl per serving', 'new dishes', 'vegan', 4,
        'side/side-4.png'),
       ('chicken tortilla soup', '3.5', '299', '10.00', '2.00', '01 bowl per serving', 'new dishes', 'meat', 4,
        'side/side-5.png'),
       ('Churros', '4.5', '999', '7.00', '0.00', '05 pieces per serving', 'best seller', 'vegan', 5,
        'dessert/dessert-1.png'),
       ('Fried Ice Cream', '4.5', '999', '5.00', '1.00', '01 piece per serving', 'best seller', 'vegan', 5,
        'dessert/dessert-2.png'),
       ('Dulce de Leche', '4.5', '50', '4.00', '0.00', '01 bowl per serving', 'new dishes', 'vegan', 5,
        'dessert/dessert-3.png'),
       ('Sweet Corn Cake', '3', '599', '4.00', '1.00', '02 pieces per serving', 'seasonal dishes online only', 'vegan',
        5, 'dessert/dessert-4.png'),
       ('Sopapillas', '4', '199', '4.00', '0.00', '10 pieces per serving', 'normal', 'vegan', 5,
        'dessert/dessert-5.png'),
       ('Conchas', '4', '299', '5.00', '0.00', '10 pieces per serving', 'normal', 'vegan', 5,
        'dessert/dessert-6.png'),
       ('Horchata', '4.5', '999', '4.00', '0.00', '01 glass per serving', 'normal', 'vegan', 5,
        'dessert/dessert-7.png'),
       ('Margarita', '4.5', '999', '5.00', '0.00', '01 glass per serving', 'best seller', 'vegan', 6,
        'drink/drink-1.png'),
       ('Michelada', '4.5', '999', '5.00', '0.00', '01 glass per serving', 'best seller', 'vegan', 6,
        'drink/drink-2.png'),
       ('paloma', '4.5', '599', '5.00', '0.00', '01 glass per serving', 'new dishes seasonal dishes', 'vegan', 6,
        'drink/drink-3.png'),
       ('Atole', '4', '999', '5.00', '1.00', '01 glass per serving', 'best seller', 'vegan', 6,
        'drink/drink-4.png'),
       ('fruit detox', '3.5', '999', '3.00', '0.00', '01 glass per serving', 'seasonal dishes best seller', 'vegan',
        6, 'drink/drink-5.png'),
       ('Coca cola', '4.5', '9999', '3.00', '0.00', '01 glass per serving', 'best seller', 'vegan', 6,
        'drink/drink-6.png');
