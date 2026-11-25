
--liquibase formatted sql

--changeset luka:005-sifarnici
INSERT INTO tip_predispitne_obaveze (id, naziv) VALUES
    (1, 'Aktivnost u toku predavanja'),
    (2, 'Praktična nastava'),
    (3, 'Kolokvijum'),
    (4, 'Seminarski rad');

INSERT INTO tip_zavrsnog_ispita (id, naziv) VALUES
    (1, 'Pismeni ispit'),
    (2, 'Usmeni ispit'),
    (3, 'Pismeno-usmeni ispit');

INSERT INTO studijski_program (id, naziv, nivo_studija) VALUES
    (1, 'Informacioni sistemi i tehnologije', 'Osnovne akademske studije'),
    (2, 'Softversko inženjerstvo', 'Master akademske studije');

--changeset luka:005-nastavnici
INSERT INTO nastavnik (id, ime, prezime, zvanje) VALUES
    (1, 'Ana', 'Jovanović', 'Redovni profesor'),
    (2, 'Nikola', 'Stanković', 'Vanredni profesor'),
    (3, 'Jelena', 'Ilić', 'Asistent');

--changeset luka:005-predmeti
INSERT INTO predmet (id, sifra, naziv, espb, status, cilj, ishod,
                     teorijska_nastava_sati, prakticna_nastava_sati,
                     laboratorijske_vezbe_sati, studijski_program_id) VALUES
    (1, 'ISIT-301', 'Razvoj softvera', 6, 'OBAVEZAN',
     'Upoznavanje studenata sa procesom razvoja softvera i principima objektno-orijentisanog projektovanja.',
     'Student je sposoban da projektuje i implementira softverski sistem srednje složenosti.',
     2, 2, 1, 1),
    (2, 'ISIT-412', 'Veb programiranje', 5, 'IZBORNI',
     'Sticanje znanja o razvoju veb aplikacija i REST servisa.',
     'Student je sposoban da samostalno razvije i dokumentuje REST API.',
     2, 3, 0, 1);

INSERT INTO predmet_nastavnik (predmet_id, nastavnik_id) VALUES
    (1, 1), (1, 3),
    (2, 2), (2, 3);

INSERT INTO sadrzaj_predmeta (predmet_id, redni_broj, opis) VALUES
    (1, 1, 'Životni ciklus razvoja softvera'),
    (1, 2, 'Objektno-orijentisano projektovanje i UML'),
    (1, 3, 'Projektni obrasci'),
    (1, 4, 'Testiranje softvera'),
    (2, 1, 'HTTP protokol i REST arhitektura'),
    (2, 2, 'Spring Boot i Spring Web'),
    (2, 3, 'Perzistencija podataka: JPA i Hibernate'),
    (2, 4, 'Dokumentovanje API-ja: OpenAPI i Swagger');

--changeset luka:005-literatura
INSERT INTO izdavac (id, naziv, mesto) VALUES
    (1, 'Addison-Wesley', 'Boston'),
    (2, 'Manning', 'Shelter Island'),
    (3, 'Prentice Hall', 'Upper Saddle River');

INSERT INTO autor (id, ime, prezime) VALUES
    (1, 'Erich', 'Gamma'),
    (2, 'Richard', 'Helm'),
    (3, 'Ralph', 'Johnson'),
    (4, 'John', 'Vlissides'),
    (5, 'Craig', 'Walls'),
    (6, 'Robert', 'Martin');

INSERT INTO literatura (id, naslov, godina, izdavac_id) VALUES
    (1, 'Design Patterns: Elements of Reusable Object-Oriented Software', 1994, 1),
    (2, 'Spring in Action', 2022, 2),
    (3, 'Clean Code', 2008, 3);

INSERT INTO literatura_autor (literatura_id, autor_id) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4),
    (2, 5),
    (3, 6);

INSERT INTO predmet_literatura (predmet_id, literatura_id) VALUES
    (1, 1), (1, 3),
    (2, 2), (2, 3);

--changeset luka:005-ocenjivanje
INSERT INTO predispitna_obaveza (predmet_id, tip_predispitne_obaveze_id, max_poena) VALUES
    (1, 1, 10), (1, 2, 20), (1, 3, 20),
    (2, 1, 10), (2, 2, 30), (2, 4, 20);

INSERT INTO zavrsni_ispit (predmet_id, tip_zavrsnog_ispita_id, max_poena) VALUES
    (1, 1, 50),
    (2, 2, 40);