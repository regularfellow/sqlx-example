DROP TABLE IF EXISTS sql_example_test;

CREATE TABLE sql_example_test (
    col_1 integer NOT NULL,
    col_2 timestamp NOT NULL
);

INSERT INTO sql_example_test (col_1, col_2)
    VALUES (123, now());
