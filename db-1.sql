DROP TABLE IF EXISTS test;

CREATE TABLE test (
    col_1 integer NOT NULL,
    col_2 timestamp NOT NULL
);

INSERT INTO test (col_1, col_2)
    VALUES (123, now());
