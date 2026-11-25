
--liquibase formatted sql

--changeset luka:003-literatura
CREATE TABLE literatura (
    id         BIGINT       AUTO_INCREMENT PRIMARY KEY,
    naslov     VARCHAR(255) NOT NULL,
    godina     INT,
    izdavac_id BIGINT       NOT NULL,
    CONSTRAINT fk_literatura_izdavac
        FOREIGN KEY (izdavac_id) REFERENCES izdavac (id)
);
--rollback DROP TABLE literatura;

--changeset luka:003-literatura-autor
CREATE TABLE literatura_autor (
    literatura_id BIGINT NOT NULL,
    autor_id      BIGINT NOT NULL,
    PRIMARY KEY (literatura_id, autor_id),
    CONSTRAINT fk_la_literatura
        FOREIGN KEY (literatura_id) REFERENCES literatura (id) ON DELETE CASCADE,
    CONSTRAINT fk_la_autor
        FOREIGN KEY (autor_id) REFERENCES autor (id) ON DELETE CASCADE
);
--rollback DROP TABLE literatura_autor;

--changeset luka:003-predmet-literatura
CREATE TABLE predmet_literatura (
    predmet_id    BIGINT NOT NULL,
    literatura_id BIGINT NOT NULL,
    PRIMARY KEY (predmet_id, literatura_id),
    CONSTRAINT fk_pl_predmet
        FOREIGN KEY (predmet_id) REFERENCES predmet (id) ON DELETE CASCADE,
    CONSTRAINT fk_pl_literatura
        FOREIGN KEY (literatura_id) REFERENCES literatura (id) ON DELETE CASCADE
);
--rollback DROP TABLE predmet_literatura;