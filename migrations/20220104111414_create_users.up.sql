CREATE TABLE users (
    id bigserial not null primary key,
    email varchar not null unique,
    encrypted_password VARCHAR NOT NULL
);