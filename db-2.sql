DROP TABLE IF EXISTS sql_example_test;

CREATE TABLE sql_example_test (
    col_2 timestamp NOT NULL,
    col_1 integer NOT NULL
);

INSERT INTO sql_example_test (col_1, col_2)
    VALUES (123, now());
