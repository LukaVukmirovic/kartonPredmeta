
--liquibase formatted sql

--changeset luka:004-predispitna-obaveza
CREATE TABLE predispitna_obaveza (
    id                         BIGINT AUTO_INCREMENT PRIMARY KEY,
    max_poena                  INT    NOT NULL,
    predmet_id                 BIGINT NOT NULL,
    tip_predispitne_obaveze_id BIGINT NOT NULL,
    CONSTRAINT chk_po_max_poena CHECK (max_poena BETWEEN 0 AND 100),
    CONSTRAINT fk_po_predmet
        FOREIGN KEY (predmet_id) REFERENCES predmet (id) ON DELETE CASCADE,
    CONSTRAINT fk_po_tip
        FOREIGN KEY (tip_predispitne_obaveze_id) REFERENCES tip_predispitne_obaveze (id)
);
--rollback DROP TABLE predispitna_obaveza;

--changeset luka:004-zavrsni-ispit
CREATE TABLE zavrsni_ispit (
    id                     BIGINT AUTO_INCREMENT PRIMARY KEY,
    max_poena              INT    NOT NULL,
    predmet_id             BIGINT NOT NULL,
    tip_zavrsnog_ispita_id BIGINT NOT NULL,
    CONSTRAINT chk_zi_max_poena CHECK (max_poena BETWEEN 0 AND 100),
    CONSTRAINT fk_zi_predmet
        FOREIGN KEY (predmet_id) REFERENCES predmet (id) ON DELETE CASCADE,
    CONSTRAINT fk_zi_tip
        FOREIGN KEY (tip_zavrsnog_ispita_id) REFERENCES tip_zavrsnog_ispita (id)
);
--rollback DROP TABLE zavrsni_ispit;