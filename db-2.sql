DROP TABLE IF EXISTS test;

CREATE TABLE test (
    col_2 timestamp NOT NULL,
    col_1 integer NOT NULL
);

INSERT INTO test (col_1, col_2)
    VALUES (123, now());
