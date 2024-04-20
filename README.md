
CREATE TABLE person (
    person_id INT NOT NULL,
    name VARCHAR(20),
    PRIMARY KEY (person_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_number INT NOT NULL,
    person_id INT,
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);
