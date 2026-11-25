
--liquibase formatted sql

--changeset luka:001-studijski-program
CREATE TABLE studijski_program (
    id           BIGINT       AUTO_INCREMENT PRIMARY KEY,
    naziv        VARCHAR(255) NOT NULL,
    nivo_studija VARCHAR(100) NOT NULL
);
--rollback DROP TABLE studijski_program;

--changeset luka:001-nastavnik
CREATE TABLE nastavnik (
    id      BIGINT       AUTO_INCREMENT PRIMARY KEY,
    ime     VARCHAR(100) NOT NULL,
    prezime VARCHAR(100) NOT NULL,
    zvanje  VARCHAR(100) NOT NULL
);
--rollback DROP TABLE nastavnik;

--changeset luka:001-izdavac
CREATE TABLE izdavac (
    id    BIGINT       AUTO_INCREMENT PRIMARY KEY,
    naziv VARCHAR(255) NOT NULL,
    mesto VARCHAR(100)
);
--rollback DROP TABLE izdavac;

--changeset luka:001-autor
CREATE TABLE autor (
    id      BIGINT       AUTO_INCREMENT PRIMARY KEY,
    ime     VARCHAR(100) NOT NULL,
    prezime VARCHAR(100) NOT NULL
);
--rollback DROP TABLE autor;

--changeset luka:001-tip-predispitne-obaveze
CREATE TABLE tip_predispitne_obaveze (
    id    BIGINT       AUTO_INCREMENT PRIMARY KEY,
    naziv VARCHAR(100) NOT NULL UNIQUE
);
--rollback DROP TABLE tip_predispitne_obaveze;

--changeset luka:001-tip-zavrsnog-ispita
CREATE TABLE tip_zavrsnog_ispita (
    id    BIGINT       AUTO_INCREMENT PRIMARY KEY,
    naziv VARCHAR(100) NOT NULL UNIQUE
);
--rollback DROP TABLE tip_zavrsnog_ispita;