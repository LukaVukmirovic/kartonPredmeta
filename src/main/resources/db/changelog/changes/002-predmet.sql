
--liquibase formatted sql

--changeset luka:002-predmet
CREATE TABLE predmet (
    id                        BIGINT       AUTO_INCREMENT PRIMARY KEY,
    sifra                     VARCHAR(20)  NOT NULL UNIQUE,
    naziv                     VARCHAR(255) NOT NULL,
    espb                      INT          NOT NULL,
    status                    VARCHAR(20)  NOT NULL,
    cilj                      TEXT,
    ishod                     TEXT,
    teorijska_nastava_sati    INT          NOT NULL DEFAULT 0,
    prakticna_nastava_sati    INT          NOT NULL DEFAULT 0,
    laboratorijske_vezbe_sati INT          NOT NULL DEFAULT 0,
    studijski_program_id      BIGINT       NOT NULL,
    CONSTRAINT chk_predmet_espb   CHECK (espb > 0),
    CONSTRAINT chk_predmet_status CHECK (status IN ('OBAVEZAN', 'IZBORNI')),
    CONSTRAINT fk_predmet_studijski_program
        FOREIGN KEY (studijski_program_id) REFERENCES studijski_program (id)
);
--rollback DROP TABLE predmet;

--changeset luka:002-predmet-nastavnik
CREATE TABLE predmet_nastavnik (
    predmet_id   BIGINT NOT NULL,
    nastavnik_id BIGINT NOT NULL,
    PRIMARY KEY (predmet_id, nastavnik_id),
    CONSTRAINT fk_pn_predmet
        FOREIGN KEY (predmet_id) REFERENCES predmet (id) ON DELETE CASCADE,
    CONSTRAINT fk_pn_nastavnik
        FOREIGN KEY (nastavnik_id) REFERENCES nastavnik (id) ON DELETE CASCADE
);
--rollback DROP TABLE predmet_nastavnik;

--changeset luka:002-sadrzaj-predmeta
CREATE TABLE sadrzaj_predmeta (
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    redni_broj INT    NOT NULL,
    opis       TEXT   NOT NULL,
    predmet_id BIGINT NOT NULL,
    CONSTRAINT uq_sadrzaj_predmet_redni_broj UNIQUE (predmet_id, redni_broj),
    CONSTRAINT fk_sadrzaj_predmet
        FOREIGN KEY (predmet_id) REFERENCES predmet (id) ON DELETE CASCADE
);
--rollback DROP TABLE sadrzaj_predmeta;