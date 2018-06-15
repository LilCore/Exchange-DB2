 
 
 -- Tablas para generar
CREATE TABLE nombres( 
id number NOT NULL,
nombre varchar2(50) NOT NULL
);


CREATE TABLE apellidos( 
id number NOT NULL,
apellido varchar2(50) NOT NULL
);


CREATE TABLE emails( 
id number NOT NULL,
email varchar2(50) NOT NULL
);


CREATE TABLE bancos( 
id number NOT NULL,
banco varchar2(50) NOT NULL
);

CREATE SEQUENCE seq_nombres
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE seq_apellidos
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE seq_emails
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE seq_bancos
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE TRIGGER tri_nombres
BEFORE INSERT ON nombres
FOR EACH ROW
BEGIN
   :NEW.id := seq_nombres.NextVal;
END;
/
CREATE TRIGGER tri_apellidos
BEFORE INSERT ON apellidos
FOR EACH ROW
BEGIN
   :NEW.id := seq_apellidos.NextVal;
END;
/
CREATE TRIGGER tri_emails
BEFORE INSERT ON emails
FOR EACH ROW
BEGIN
   :NEW.id := seq_emails.NextVal;
END;
/
CREATE TRIGGER tri_bancos
BEFORE INSERT ON bancos
FOR EACH ROW
BEGIN
   :NEW.id := seq_bancos.NextVal;
END;
/


--Insert nombres
INSERT INTO nombres (nombre) VALUES ('Magee');
INSERT INTO nombres (nombre) VALUES ('Kirk');
INSERT INTO nombres (nombre) VALUES ('Victor');
INSERT INTO nombres (nombre) VALUES ('Giacomo');
INSERT INTO nombres (nombre) VALUES ('Cairo');
INSERT INTO nombres (nombre) VALUES ('Driscoll');
INSERT INTO nombres (nombre) VALUES ('Felix');
INSERT INTO nombres (nombre) VALUES ('Barrett');
INSERT INTO nombres (nombre) VALUES ('Reese');
INSERT INTO nombres (nombre) VALUES ('Colby');
INSERT INTO nombres (nombre) VALUES ('Joseph');
INSERT INTO nombres (nombre) VALUES ('Blaze');
INSERT INTO nombres (nombre) VALUES ('Jordan');
INSERT INTO nombres (nombre) VALUES ('Devin');
INSERT INTO nombres (nombre) VALUES ('Cooper');
INSERT INTO nombres (nombre) VALUES ('Ferdinand');
INSERT INTO nombres (nombre) VALUES ('Luke');
INSERT INTO nombres (nombre) VALUES ('Peter');
INSERT INTO nombres (nombre) VALUES ('Isaiah');
INSERT INTO nombres (nombre) VALUES ('Elton');
INSERT INTO nombres (nombre) VALUES ('Dylan');
INSERT INTO nombres (nombre) VALUES ('Barrett');
INSERT INTO nombres (nombre) VALUES ('Lucius');
INSERT INTO nombres (nombre) VALUES ('Chaney');
INSERT INTO nombres (nombre) VALUES ('Alvin');
INSERT INTO nombres (nombre) VALUES ('Cairo');
INSERT INTO nombres (nombre) VALUES ('Vance');
INSERT INTO nombres (nombre) VALUES ('Eric');
INSERT INTO nombres (nombre) VALUES ('Ezra');
INSERT INTO nombres (nombre) VALUES ('Laith');
INSERT INTO nombres (nombre) VALUES ('Alfonso');
INSERT INTO nombres (nombre) VALUES ('Garrett');
INSERT INTO nombres (nombre) VALUES ('Lawrence');
INSERT INTO nombres (nombre) VALUES ('Uriel');
INSERT INTO nombres (nombre) VALUES ('Drake');
INSERT INTO nombres (nombre) VALUES ('Patrick');
INSERT INTO nombres (nombre) VALUES ('Sean');
INSERT INTO nombres (nombre) VALUES ('Eric');
INSERT INTO nombres (nombre) VALUES ('Keith');
INSERT INTO nombres (nombre) VALUES ('Todd');
INSERT INTO nombres (nombre) VALUES ('Ross');
INSERT INTO nombres (nombre) VALUES ('Jeremy');
INSERT INTO nombres (nombre) VALUES ('Andrew');
INSERT INTO nombres (nombre) VALUES ('Oren');
INSERT INTO nombres (nombre) VALUES ('Mufutau');
INSERT INTO nombres (nombre) VALUES ('Zachery');
INSERT INTO nombres (nombre) VALUES ('Jerry');
INSERT INTO nombres (nombre) VALUES ('Harper');
INSERT INTO nombres (nombre) VALUES ('Norman');
INSERT INTO nombres (nombre) VALUES ('Thaddeus');
INSERT INTO nombres (nombre) VALUES ('Cruz');
INSERT INTO nombres (nombre) VALUES ('Harlan');
INSERT INTO nombres (nombre) VALUES ('Gareth');
INSERT INTO nombres (nombre) VALUES ('Gannon');
INSERT INTO nombres (nombre) VALUES ('Rudyard');
INSERT INTO nombres (nombre) VALUES ('Harrison');
INSERT INTO nombres (nombre) VALUES ('Octavius');
INSERT INTO nombres (nombre) VALUES ('Octavius');
INSERT INTO nombres (nombre) VALUES ('Cameron');
INSERT INTO nombres (nombre) VALUES ('Upton');
INSERT INTO nombres (nombre) VALUES ('Kasimir');
INSERT INTO nombres (nombre) VALUES ('Melvin');
INSERT INTO nombres (nombre) VALUES ('Baker');
INSERT INTO nombres (nombre) VALUES ('Paul');
INSERT INTO nombres (nombre) VALUES ('Ezekiel');
INSERT INTO nombres (nombre) VALUES ('Scott');
INSERT INTO nombres (nombre) VALUES ('Herrod');
INSERT INTO nombres (nombre) VALUES ('Oliver');
INSERT INTO nombres (nombre) VALUES ('Erich');
INSERT INTO nombres (nombre) VALUES ('Damon');
INSERT INTO nombres (nombre) VALUES ('Elijah');
INSERT INTO nombres (nombre) VALUES ('Isaiah');
INSERT INTO nombres (nombre) VALUES ('Noah');
INSERT INTO nombres (nombre) VALUES ('Xander');
INSERT INTO nombres (nombre) VALUES ('Xenos');
INSERT INTO nombres (nombre) VALUES ('Fritz');
INSERT INTO nombres (nombre) VALUES ('Talon');
INSERT INTO nombres (nombre) VALUES ('Barry');
INSERT INTO nombres (nombre) VALUES ('Walker');
INSERT INTO nombres (nombre) VALUES ('Allistair');
INSERT INTO nombres (nombre) VALUES ('Samson');
INSERT INTO nombres (nombre) VALUES ('Xavier');
INSERT INTO nombres (nombre) VALUES ('Thor');
INSERT INTO nombres (nombre) VALUES ('Clark');
INSERT INTO nombres (nombre) VALUES ('Kuame');
INSERT INTO nombres (nombre) VALUES ('Christian');
INSERT INTO nombres (nombre) VALUES ('Hakeem');
INSERT INTO nombres (nombre) VALUES ('Judah');
INSERT INTO nombres (nombre) VALUES ('Elliott');
INSERT INTO nombres (nombre) VALUES ('Amal');
INSERT INTO nombres (nombre) VALUES ('Bradley');
INSERT INTO nombres (nombre) VALUES ('Gary');
INSERT INTO nombres (nombre) VALUES ('Dennis');
INSERT INTO nombres (nombre) VALUES ('Jacob');
INSERT INTO nombres (nombre) VALUES ('Yardley');
INSERT INTO nombres (nombre) VALUES ('Bevis');
INSERT INTO nombres (nombre) VALUES ('Ian');
INSERT INTO nombres (nombre) VALUES ('Phelan');
INSERT INTO nombres (nombre) VALUES ('Gabriel');
INSERT INTO nombres (nombre) VALUES ('Zachery');

INSERT INTO nombres (nombre) VALUES ('Kaden');
INSERT INTO nombres (nombre) VALUES ('Breanna');
INSERT INTO nombres (nombre) VALUES ('Nelle');
INSERT INTO nombres (nombre) VALUES ('Camilla');
INSERT INTO nombres (nombre) VALUES ('Leslie');
INSERT INTO nombres (nombre) VALUES ('Neve');
INSERT INTO nombres (nombre) VALUES ('Olympia');
INSERT INTO nombres (nombre) VALUES ('Xantha');
INSERT INTO nombres (nombre) VALUES ('Shoshana');
INSERT INTO nombres (nombre) VALUES ('Shoshana');
INSERT INTO nombres (nombre) VALUES ('Tasha');
INSERT INTO nombres (nombre) VALUES ('Chanda');
INSERT INTO nombres (nombre) VALUES ('Quincy');
INSERT INTO nombres (nombre) VALUES ('Hilda');
INSERT INTO nombres (nombre) VALUES ('Zorita');
INSERT INTO nombres (nombre) VALUES ('Dana');
INSERT INTO nombres (nombre) VALUES ('Scarlet');
INSERT INTO nombres (nombre) VALUES ('Jescie');
INSERT INTO nombres (nombre) VALUES ('Amaya');
INSERT INTO nombres (nombre) VALUES ('Kiara');
INSERT INTO nombres (nombre) VALUES ('Quail');
INSERT INTO nombres (nombre) VALUES ('Brenda');
INSERT INTO nombres (nombre) VALUES ('Adena');
INSERT INTO nombres (nombre) VALUES ('Echo');
INSERT INTO nombres (nombre) VALUES ('Kelsey');
INSERT INTO nombres (nombre) VALUES ('Cheryl');
INSERT INTO nombres (nombre) VALUES ('Charlotte');
INSERT INTO nombres (nombre) VALUES ('Cassandra');
INSERT INTO nombres (nombre) VALUES ('Glenna');
INSERT INTO nombres (nombre) VALUES ('Natalie');
INSERT INTO nombres (nombre) VALUES ('Kai');
INSERT INTO nombres (nombre) VALUES ('Halla');
INSERT INTO nombres (nombre) VALUES ('Alexis');
INSERT INTO nombres (nombre) VALUES ('Joan');
INSERT INTO nombres (nombre) VALUES ('Fleur');
INSERT INTO nombres (nombre) VALUES ('Neve');
INSERT INTO nombres (nombre) VALUES ('Brenda');
INSERT INTO nombres (nombre) VALUES ('Blair');
INSERT INTO nombres (nombre) VALUES ('Charity');
INSERT INTO nombres (nombre) VALUES ('Lacota');
INSERT INTO nombres (nombre) VALUES ('Margaret');
INSERT INTO nombres (nombre) VALUES ('Farrah');
INSERT INTO nombres (nombre) VALUES ('Blair');
INSERT INTO nombres (nombre) VALUES ('Bertha');
INSERT INTO nombres (nombre) VALUES ('Delilah');
INSERT INTO nombres (nombre) VALUES ('Marah');
INSERT INTO nombres (nombre) VALUES ('Cheyenne');
INSERT INTO nombres (nombre) VALUES ('Hannah');
INSERT INTO nombres (nombre) VALUES ('Meredith');
INSERT INTO nombres (nombre) VALUES ('Sage');
INSERT INTO nombres (nombre) VALUES ('Regan');
INSERT INTO nombres (nombre) VALUES ('Kylynn');
INSERT INTO nombres (nombre) VALUES ('Unity');
INSERT INTO nombres (nombre) VALUES ('Anjolie');
INSERT INTO nombres (nombre) VALUES ('Darrel');
INSERT INTO nombres (nombre) VALUES ('Sade');
INSERT INTO nombres (nombre) VALUES ('Jenna');
INSERT INTO nombres (nombre) VALUES ('Keely');
INSERT INTO nombres (nombre) VALUES ('Kathleen');
INSERT INTO nombres (nombre) VALUES ('Zia');
INSERT INTO nombres (nombre) VALUES ('Tallulah');
INSERT INTO nombres (nombre) VALUES ('Jael');
INSERT INTO nombres (nombre) VALUES ('Amity');
INSERT INTO nombres (nombre) VALUES ('Quail');
INSERT INTO nombres (nombre) VALUES ('Imogene');
INSERT INTO nombres (nombre) VALUES ('Sybill');
INSERT INTO nombres (nombre) VALUES ('Tamara');
INSERT INTO nombres (nombre) VALUES ('Carla');
INSERT INTO nombres (nombre) VALUES ('Chantale');
INSERT INTO nombres (nombre) VALUES ('Madonna');
INSERT INTO nombres (nombre) VALUES ('Moana');
INSERT INTO nombres (nombre) VALUES ('Adria');
INSERT INTO nombres (nombre) VALUES ('Alana');
INSERT INTO nombres (nombre) VALUES ('Darrel');
INSERT INTO nombres (nombre) VALUES ('Astra');
INSERT INTO nombres (nombre) VALUES ('Desiree');
INSERT INTO nombres (nombre) VALUES ('Beatrice');
INSERT INTO nombres (nombre) VALUES ('Kay');
INSERT INTO nombres (nombre) VALUES ('Vera');
INSERT INTO nombres (nombre) VALUES ('Karly');
INSERT INTO nombres (nombre) VALUES ('Kaitlin');
INSERT INTO nombres (nombre) VALUES ('Petra');
INSERT INTO nombres (nombre) VALUES ('Darryl');
INSERT INTO nombres (nombre) VALUES ('Tatiana');
INSERT INTO nombres (nombre) VALUES ('Tamara');
INSERT INTO nombres (nombre) VALUES ('Amelia');
INSERT INTO nombres (nombre) VALUES ('Paula');
INSERT INTO nombres (nombre) VALUES ('Aimee');
INSERT INTO nombres (nombre) VALUES ('Meredith');
INSERT INTO nombres (nombre) VALUES ('Maite');
INSERT INTO nombres (nombre) VALUES ('Mira');
INSERT INTO nombres (nombre) VALUES ('Xena');
INSERT INTO nombres (nombre) VALUES ('Nola');
INSERT INTO nombres (nombre) VALUES ('Audra');
INSERT INTO nombres (nombre) VALUES ('Tashya');
INSERT INTO nombres (nombre) VALUES ('Ingrid');
INSERT INTO nombres (nombre) VALUES ('Hyacinth');
INSERT INTO nombres (nombre) VALUES ('Jasmine');
INSERT INTO nombres (nombre) VALUES ('Margaret');
INSERT INTO nombres (nombre) VALUES ('Dahlia');


--Insert Apellidos
INSERT INTO apellidos (apellido) VALUES ('Huff');
INSERT INTO apellidos (apellido) VALUES ('Peters');
INSERT INTO apellidos (apellido) VALUES ('Ballard');
INSERT INTO apellidos (apellido) VALUES ('Rosales');
INSERT INTO apellidos (apellido) VALUES ('Wolf');
INSERT INTO apellidos (apellido) VALUES ('Thomas');
INSERT INTO apellidos (apellido) VALUES ('Todd');
INSERT INTO apellidos (apellido) VALUES ('Ball');
INSERT INTO apellidos (apellido) VALUES ('Cox');
INSERT INTO apellidos (apellido) VALUES ('Greene');
INSERT INTO apellidos (apellido) VALUES ('Mathews');
INSERT INTO apellidos (apellido) VALUES ('Finch');
INSERT INTO apellidos (apellido) VALUES ('Bullock');
INSERT INTO apellidos (apellido) VALUES ('Morgan');
INSERT INTO apellidos (apellido) VALUES ('Harding');
INSERT INTO apellidos (apellido) VALUES ('Wolf');
INSERT INTO apellidos (apellido) VALUES ('Norman');
INSERT INTO apellidos (apellido) VALUES ('Rocha');
INSERT INTO apellidos (apellido) VALUES ('Davenport');
INSERT INTO apellidos (apellido) VALUES ('Beach');
INSERT INTO apellidos (apellido) VALUES ('Spence');
INSERT INTO apellidos (apellido) VALUES ('Mooney');
INSERT INTO apellidos (apellido) VALUES ('Vinson');
INSERT INTO apellidos (apellido) VALUES ('Bowen');
INSERT INTO apellidos (apellido) VALUES ('Hester');
INSERT INTO apellidos (apellido) VALUES ('Rosales');
INSERT INTO apellidos (apellido) VALUES ('Buckley');
INSERT INTO apellidos (apellido) VALUES ('Sanchez');
INSERT INTO apellidos (apellido) VALUES ('Barrett');
INSERT INTO apellidos (apellido) VALUES ('Hart');
INSERT INTO apellidos (apellido) VALUES ('Nichols');
INSERT INTO apellidos (apellido) VALUES ('Acosta');
INSERT INTO apellidos (apellido) VALUES ('Fischer');
INSERT INTO apellidos (apellido) VALUES ('Waters');
INSERT INTO apellidos (apellido) VALUES ('Rivera');
INSERT INTO apellidos (apellido) VALUES ('Hopkins');
INSERT INTO apellidos (apellido) VALUES ('Howell');
INSERT INTO apellidos (apellido) VALUES ('Richmond');
INSERT INTO apellidos (apellido) VALUES ('Talley');
INSERT INTO apellidos (apellido) VALUES ('Goodwin');
INSERT INTO apellidos (apellido) VALUES ('Simmons');
INSERT INTO apellidos (apellido) VALUES ('Howell');
INSERT INTO apellidos (apellido) VALUES ('Fox');
INSERT INTO apellidos (apellido) VALUES ('Blackwell');
INSERT INTO apellidos (apellido) VALUES ('Solomon');
INSERT INTO apellidos (apellido) VALUES ('Munoz');
INSERT INTO apellidos (apellido) VALUES ('Nicholson');
INSERT INTO apellidos (apellido) VALUES ('Carrillo');
INSERT INTO apellidos (apellido) VALUES ('Miller');
INSERT INTO apellidos (apellido) VALUES ('Phillips');
INSERT INTO apellidos (apellido) VALUES ('Calhoun');
INSERT INTO apellidos (apellido) VALUES ('Kirkland');
INSERT INTO apellidos (apellido) VALUES ('Hancock');
INSERT INTO apellidos (apellido) VALUES ('Walsh');
INSERT INTO apellidos (apellido) VALUES ('Ruiz');
INSERT INTO apellidos (apellido) VALUES ('Hess');
INSERT INTO apellidos (apellido) VALUES ('Avery');
INSERT INTO apellidos (apellido) VALUES ('Richmond');
INSERT INTO apellidos (apellido) VALUES ('Campbell');
INSERT INTO apellidos (apellido) VALUES ('Nash');
INSERT INTO apellidos (apellido) VALUES ('Dillon');
INSERT INTO apellidos (apellido) VALUES ('Caldwell');
INSERT INTO apellidos (apellido) VALUES ('Kennedy');
INSERT INTO apellidos (apellido) VALUES ('Christian');
INSERT INTO apellidos (apellido) VALUES ('Ratliff');
INSERT INTO apellidos (apellido) VALUES ('Larson');
INSERT INTO apellidos (apellido) VALUES ('Lara');
INSERT INTO apellidos (apellido) VALUES ('Barr');
INSERT INTO apellidos (apellido) VALUES ('Andrews');
INSERT INTO apellidos (apellido) VALUES ('Mcgowan');
INSERT INTO apellidos (apellido) VALUES ('Blair');
INSERT INTO apellidos (apellido) VALUES ('Higgins');
INSERT INTO apellidos (apellido) VALUES ('Newman');
INSERT INTO apellidos (apellido) VALUES ('Hogan');
INSERT INTO apellidos (apellido) VALUES ('Wood');
INSERT INTO apellidos (apellido) VALUES ('Tyson');
INSERT INTO apellidos (apellido) VALUES ('Stephens');
INSERT INTO apellidos (apellido) VALUES ('Mcguire');
INSERT INTO apellidos (apellido) VALUES ('Jordan');
INSERT INTO apellidos (apellido) VALUES ('Norris');
INSERT INTO apellidos (apellido) VALUES ('Lawson');
INSERT INTO apellidos (apellido) VALUES ('Cantu');
INSERT INTO apellidos (apellido) VALUES ('Kirkland');
INSERT INTO apellidos (apellido) VALUES ('David');
INSERT INTO apellidos (apellido) VALUES ('Griffith');
INSERT INTO apellidos (apellido) VALUES ('Guerra');
INSERT INTO apellidos (apellido) VALUES ('Robles');
INSERT INTO apellidos (apellido) VALUES ('Romero');
INSERT INTO apellidos (apellido) VALUES ('Landry');
INSERT INTO apellidos (apellido) VALUES ('Wilson');
INSERT INTO apellidos (apellido) VALUES ('Hooper');
INSERT INTO apellidos (apellido) VALUES ('Cain');
INSERT INTO apellidos (apellido) VALUES ('Mcmahon');
INSERT INTO apellidos (apellido) VALUES ('Hutchinson');
INSERT INTO apellidos (apellido) VALUES ('Robbins');
INSERT INTO apellidos (apellido) VALUES ('Russell');
INSERT INTO apellidos (apellido) VALUES ('Lang');
INSERT INTO apellidos (apellido) VALUES ('Haynes');
INSERT INTO apellidos (apellido) VALUES ('Newman');
INSERT INTO apellidos (apellido) VALUES ('Trujillo');
INSERT INTO apellidos (apellido) VALUES ('Woodward');
INSERT INTO apellidos (apellido) VALUES ('Horton');
INSERT INTO apellidos (apellido) VALUES ('Fowler');
INSERT INTO apellidos (apellido) VALUES ('Butler');
INSERT INTO apellidos (apellido) VALUES ('Rodriguez');
INSERT INTO apellidos (apellido) VALUES ('Gallegos');
INSERT INTO apellidos (apellido) VALUES ('Stuart');
INSERT INTO apellidos (apellido) VALUES ('Phillips');
INSERT INTO apellidos (apellido) VALUES ('Emerson');
INSERT INTO apellidos (apellido) VALUES ('Bryant');
INSERT INTO apellidos (apellido) VALUES ('Montoya');
INSERT INTO apellidos (apellido) VALUES ('Hansen');
INSERT INTO apellidos (apellido) VALUES ('Cotton');
INSERT INTO apellidos (apellido) VALUES ('Delgado');
INSERT INTO apellidos (apellido) VALUES ('Larsen');
INSERT INTO apellidos (apellido) VALUES ('Hobbs');
INSERT INTO apellidos (apellido) VALUES ('Taylor');
INSERT INTO apellidos (apellido) VALUES ('Clemons');
INSERT INTO apellidos (apellido) VALUES ('Russell');
INSERT INTO apellidos (apellido) VALUES ('Hogan');
INSERT INTO apellidos (apellido) VALUES ('Fletcher');
INSERT INTO apellidos (apellido) VALUES ('Farmer');
INSERT INTO apellidos (apellido) VALUES ('Hinton');
INSERT INTO apellidos (apellido) VALUES ('Rivas');
INSERT INTO apellidos (apellido) VALUES ('Knapp');
INSERT INTO apellidos (apellido) VALUES ('Glenn');
INSERT INTO apellidos (apellido) VALUES ('Holcomb');
INSERT INTO apellidos (apellido) VALUES ('Decker');
INSERT INTO apellidos (apellido) VALUES ('Wyatt');
INSERT INTO apellidos (apellido) VALUES ('Ingram');
INSERT INTO apellidos (apellido) VALUES ('Emerson');
INSERT INTO apellidos (apellido) VALUES ('Atkins');
INSERT INTO apellidos (apellido) VALUES ('Matthews');
INSERT INTO apellidos (apellido) VALUES ('Collins');
INSERT INTO apellidos (apellido) VALUES ('Bradshaw');
INSERT INTO apellidos (apellido) VALUES ('Odonnell');
INSERT INTO apellidos (apellido) VALUES ('Mccarthy');
INSERT INTO apellidos (apellido) VALUES ('Lee');
INSERT INTO apellidos (apellido) VALUES ('Graves');
INSERT INTO apellidos (apellido) VALUES ('Hendricks');
INSERT INTO apellidos (apellido) VALUES ('Richard');
INSERT INTO apellidos (apellido) VALUES ('Weber');
INSERT INTO apellidos (apellido) VALUES ('Juarez');
INSERT INTO apellidos (apellido) VALUES ('Trujillo');
INSERT INTO apellidos (apellido) VALUES ('Bowers');
INSERT INTO apellidos (apellido) VALUES ('Fowler');
INSERT INTO apellidos (apellido) VALUES ('Dorsey');
INSERT INTO apellidos (apellido) VALUES ('Perkins');
INSERT INTO apellidos (apellido) VALUES ('Ward');
INSERT INTO apellidos (apellido) VALUES ('Bartlett');
INSERT INTO apellidos (apellido) VALUES ('Goodwin');
INSERT INTO apellidos (apellido) VALUES ('Jennings');
INSERT INTO apellidos (apellido) VALUES ('Mays');
INSERT INTO apellidos (apellido) VALUES ('Stevens');
INSERT INTO apellidos (apellido) VALUES ('Schneider');
INSERT INTO apellidos (apellido) VALUES ('Mathews');
INSERT INTO apellidos (apellido) VALUES ('Cervantes');
INSERT INTO apellidos (apellido) VALUES ('Crawford');
INSERT INTO apellidos (apellido) VALUES ('Henderson');
INSERT INTO apellidos (apellido) VALUES ('Gordon');
INSERT INTO apellidos (apellido) VALUES ('Craig');
INSERT INTO apellidos (apellido) VALUES ('Paul');
INSERT INTO apellidos (apellido) VALUES ('Stewart');
INSERT INTO apellidos (apellido) VALUES ('Saunders');
INSERT INTO apellidos (apellido) VALUES ('Pollard');
INSERT INTO apellidos (apellido) VALUES ('Beard');
INSERT INTO apellidos (apellido) VALUES ('English');
INSERT INTO apellidos (apellido) VALUES ('Blackwell');
INSERT INTO apellidos (apellido) VALUES ('Emerson');
INSERT INTO apellidos (apellido) VALUES ('Flynn');
INSERT INTO apellidos (apellido) VALUES ('Browning');
INSERT INTO apellidos (apellido) VALUES ('Larsen');
INSERT INTO apellidos (apellido) VALUES ('Chapman');
INSERT INTO apellidos (apellido) VALUES ('Charles');
INSERT INTO apellidos (apellido) VALUES ('Briggs');
INSERT INTO apellidos (apellido) VALUES ('Albert');
INSERT INTO apellidos (apellido) VALUES ('Riggs');
INSERT INTO apellidos (apellido) VALUES ('Vega');
INSERT INTO apellidos (apellido) VALUES ('Jarvis');
INSERT INTO apellidos (apellido) VALUES ('Schwartz');
INSERT INTO apellidos (apellido) VALUES ('Pennington');
INSERT INTO apellidos (apellido) VALUES ('Mathis');
INSERT INTO apellidos (apellido) VALUES ('Morales');
INSERT INTO apellidos (apellido) VALUES ('Baxter');
INSERT INTO apellidos (apellido) VALUES ('Britt');
INSERT INTO apellidos (apellido) VALUES ('Hooper');
INSERT INTO apellidos (apellido) VALUES ('Watson');
INSERT INTO apellidos (apellido) VALUES ('Sears');
INSERT INTO apellidos (apellido) VALUES ('Santana');
INSERT INTO apellidos (apellido) VALUES ('Lowe');
INSERT INTO apellidos (apellido) VALUES ('Lara');
INSERT INTO apellidos (apellido) VALUES ('Berry');
INSERT INTO apellidos (apellido) VALUES ('Fuller');
INSERT INTO apellidos (apellido) VALUES ('Coffey');
INSERT INTO apellidos (apellido) VALUES ('Hull');
INSERT INTO apellidos (apellido) VALUES ('Mcneil');
INSERT INTO apellidos (apellido) VALUES ('Finley');
INSERT INTO apellidos (apellido) VALUES ('Mcdonald');
INSERT INTO apellidos (apellido) VALUES ('Combs');
INSERT INTO apellidos (apellido) VALUES ('Gaines');


--Emails 
INSERT INTO emails (email) VALUES ('at.lacus@mauris.ca');
INSERT INTO emails (email) VALUES ('blandit.congue@metusAliquam.ca');
INSERT INTO emails (email) VALUES ('mi.lorem.vehicula@sem.com');
INSERT INTO emails (email) VALUES ('parturient.montes@duiSuspendisseac.com');
INSERT INTO emails (email) VALUES ('Nunc.ac.sem@disparturientmontes.ca');
INSERT INTO emails (email) VALUES ('penatibus@enimconsequatpurus.org');
INSERT INTO emails (email) VALUES ('aliquam@nonlacinia.org');
INSERT INTO emails (email) VALUES ('fringilla@egestasnuncsed.com');
INSERT INTO emails (email) VALUES ('magna@penatibus.net');
INSERT INTO emails (email) VALUES ('risus@lorem.org');
INSERT INTO emails (email) VALUES ('erat@mattisornarelectus.ca');
INSERT INTO emails (email) VALUES ('tincidunt.nibh@mollisInteger.org');
INSERT INTO emails (email) VALUES ('semper@sapien.org');
INSERT INTO emails (email) VALUES ('diam.Pellentesque@Vestibulumuteros.co.uk');
INSERT INTO emails (email) VALUES ('aliquet.vel@nuncidenim.com');
INSERT INTO emails (email) VALUES ('mi@luctusfelis.edu');
INSERT INTO emails (email) VALUES ('libero.dui.nec@egetdictum.com');
INSERT INTO emails (email) VALUES ('facilisis@loremeumetus.co.uk');
INSERT INTO emails (email) VALUES ('arcu.Sed@enim.com');
INSERT INTO emails (email) VALUES ('eu.accumsan@utsemNulla.edu');
INSERT INTO emails (email) VALUES ('vitae.aliquet@vitaesemperegestas.org');
INSERT INTO emails (email) VALUES ('dui@eueratsemper.co.uk');
INSERT INTO emails (email) VALUES ('dui@mauris.org');
INSERT INTO emails (email) VALUES ('interdum.feugiat.Sed@dignissimtempor.co.uk');
INSERT INTO emails (email) VALUES ('ante.Maecenas.mi@Cumsociis.net');
INSERT INTO emails (email) VALUES ('varius@bibendumullamcorperDuis.co.uk');
INSERT INTO emails (email) VALUES ('tellus@eu.edu');
INSERT INTO emails (email) VALUES ('est.ac.facilisis@consectetuercursuset.ca');
INSERT INTO emails (email) VALUES ('venenatis.a.magna@et.co.uk');
INSERT INTO emails (email) VALUES ('rutrum@ametdapibusid.net');
INSERT INTO emails (email) VALUES ('Etiam.ligula@miloremvehicula.com');
INSERT INTO emails (email) VALUES ('interdum@facilisisloremtristique.org');
INSERT INTO emails (email) VALUES ('ipsum.dolor@purusMaecenas.ca');
INSERT INTO emails (email) VALUES ('magnis@orcilobortisaugue.edu');
INSERT INTO emails (email) VALUES ('montes@Integer.net');
INSERT INTO emails (email) VALUES ('neque@eutellus.ca');
INSERT INTO emails (email) VALUES ('sem.semper.erat@velit.co.uk');
INSERT INTO emails (email) VALUES ('magna.et.ipsum@dolorvitaedolor.org');
INSERT INTO emails (email) VALUES ('Nullam.suscipit@accumsan.co.uk');
INSERT INTO emails (email) VALUES ('urna.justo.faucibus@Utsemperpretium.org');
INSERT INTO emails (email) VALUES ('nunc@augueeutempor.ca');
INSERT INTO emails (email) VALUES ('malesuada@duisemperet.org');
INSERT INTO emails (email) VALUES ('lobortis.Class.aptent@magnis.edu');
INSERT INTO emails (email) VALUES ('tellus@ut.com');
INSERT INTO emails (email) VALUES ('eu@nibh.net');
INSERT INTO emails (email) VALUES ('Quisque@morbitristique.net');
INSERT INTO emails (email) VALUES ('orci.lobortis@nequeNullamut.com');
INSERT INTO emails (email) VALUES ('scelerisque@sed.org');
INSERT INTO emails (email) VALUES ('luctus.Curabitur@Etiam.edu');
INSERT INTO emails (email) VALUES ('Nulla.facilisis.Suspendisse@intempus.com');
INSERT INTO emails (email) VALUES ('pede@et.co.uk');
INSERT INTO emails (email) VALUES ('montes.nascetur@mollisnoncursus.ca');
INSERT INTO emails (email) VALUES ('Vivamus@lectusNullamsuscipit.edu');
INSERT INTO emails (email) VALUES ('diam@Nunclectuspede.net');
INSERT INTO emails (email) VALUES ('massa@iaculis.net');
INSERT INTO emails (email) VALUES ('Proin.ultrices@tortorInteger.org');
INSERT INTO emails (email) VALUES ('nibh.Phasellus.nulla@convalliserateget.com');
INSERT INTO emails (email) VALUES ('laoreet.posuere.enim@euneque.net');
INSERT INTO emails (email) VALUES ('lacinia.orci.consectetuer@congueelitsed.edu');
INSERT INTO emails (email) VALUES ('Cras@necante.edu');
INSERT INTO emails (email) VALUES ('euismod.urna.Nullam@sagittissemperNam.net');
INSERT INTO emails (email) VALUES ('Nulla@massa.net');
INSERT INTO emails (email) VALUES ('elit.pharetra.ut@etmalesuada.ca');
INSERT INTO emails (email) VALUES ('gravida.molestie.arcu@erosnon.ca');
INSERT INTO emails (email) VALUES ('non.leo.Vivamus@mattisornarelectus.ca');
INSERT INTO emails (email) VALUES ('semper@Praesent.com');
INSERT INTO emails (email) VALUES ('Duis.elementum@lorem.co.uk');
INSERT INTO emails (email) VALUES ('in.felis.Nulla@convallis.net');
INSERT INTO emails (email) VALUES ('Pellentesque@luctus.edu');
INSERT INTO emails (email) VALUES ('mi.enim.condimentum@Duisvolutpat.org');
INSERT INTO emails (email) VALUES ('pretium.et.rutrum@parturient.edu');
INSERT INTO emails (email) VALUES ('fames@dictumplacerataugue.ca');
INSERT INTO emails (email) VALUES ('cursus@nibhQuisquenonummy.ca');
INSERT INTO emails (email) VALUES ('natoque.penatibus@Maurisnulla.org');
INSERT INTO emails (email) VALUES ('elit.Curabitur.sed@infelisNulla.ca');
INSERT INTO emails (email) VALUES ('Phasellus.libero.mauris@egetmollis.co.uk');
INSERT INTO emails (email) VALUES ('eros.Proin.ultrices@nec.org');
INSERT INTO emails (email) VALUES ('ridiculus@nasceturridiculusmus.edu');
INSERT INTO emails (email) VALUES ('habitant.morbi@neceleifend.ca');
INSERT INTO emails (email) VALUES ('rhoncus.Proin@ridiculusmus.edu');
INSERT INTO emails (email) VALUES ('Quisque.ornare.tortor@egetnisi.edu');
INSERT INTO emails (email) VALUES ('Vivamus.rhoncus@Phasellusvitaemauris.com');
INSERT INTO emails (email) VALUES ('orci.Ut@Duisacarcu.net');
INSERT INTO emails (email) VALUES ('enim.Curabitur.massa@ettristique.org');
INSERT INTO emails (email) VALUES ('rutrum.urna@lacusAliquam.ca');
INSERT INTO emails (email) VALUES ('ligula@purusinmolestie.ca');
INSERT INTO emails (email) VALUES ('neque.Nullam@ultricesVivamus.ca');
INSERT INTO emails (email) VALUES ('risus.Quisque.libero@augueporttitor.co.uk');
INSERT INTO emails (email) VALUES ('enim.diam.vel@tellusid.com');
INSERT INTO emails (email) VALUES ('Mauris.non@nonluctussit.net');
INSERT INTO emails (email) VALUES ('nunc.Quisque.ornare@SuspendisseduiFusce.ca');
INSERT INTO emails (email) VALUES ('pellentesque.a.facilisis@Proin.co.uk');
INSERT INTO emails (email) VALUES ('tempor.lorem.eget@loremegetmollis.net');
INSERT INTO emails (email) VALUES ('lorem.Donec.elementum@vitae.co.uk');
INSERT INTO emails (email) VALUES ('nisl.arcu@lacusEtiam.edu');
INSERT INTO emails (email) VALUES ('Aliquam@Aliquamnisl.edu');
INSERT INTO emails (email) VALUES ('Quisque@Suspendisse.ca');
INSERT INTO emails (email) VALUES ('nascetur.ridiculus.mus@sagittisNullamvitae.com');
INSERT INTO emails (email) VALUES ('sem.vitae.aliquam@ante.net');
INSERT INTO emails (email) VALUES ('ullamcorper.nisl.arcu@non.co.uk');
INSERT INTO emails (email) VALUES ('malesuada.fringilla@insodales.org');
INSERT INTO emails (email) VALUES ('Proin.nisl.sem@urnasuscipitnonummy.edu');
INSERT INTO emails (email) VALUES ('eget.dictum@sapien.com');
INSERT INTO emails (email) VALUES ('pretium.et@nuncrisusvarius.co.uk');
INSERT INTO emails (email) VALUES ('lacinia.at@tellus.com');
INSERT INTO emails (email) VALUES ('orci.in@non.ca');
INSERT INTO emails (email) VALUES ('libero.lacus.varius@Pellentesquehabitantmorbi.co.uk');
INSERT INTO emails (email) VALUES ('sociosqu@eterosProin.com');
INSERT INTO emails (email) VALUES ('ipsum.leo@Suspendissenonleo.co.uk');
INSERT INTO emails (email) VALUES ('a.feugiat@lacusAliquamrutrum.ca');
INSERT INTO emails (email) VALUES ('nec.tempus@liberoat.org');
INSERT INTO emails (email) VALUES ('fames.ac.turpis@ipsumportaelit.co.uk');
INSERT INTO emails (email) VALUES ('in@nisi.com');
INSERT INTO emails (email) VALUES ('non@metusAliquam.com');
INSERT INTO emails (email) VALUES ('malesuada.malesuada.Integer@AeneanmassaInteger.co.uk');
INSERT INTO emails (email) VALUES ('Cras.vulputate.velit@tristiqueneque.com');
INSERT INTO emails (email) VALUES ('est@purusac.org');
INSERT INTO emails (email) VALUES ('nulla@vestibulumlorem.com');
INSERT INTO emails (email) VALUES ('convallis@malesuada.edu');
INSERT INTO emails (email) VALUES ('Fusce.mollis.Duis@adipiscing.com');
INSERT INTO emails (email) VALUES ('Proin.dolor.Nulla@ac.net');
INSERT INTO emails (email) VALUES ('sit.amet.risus@nec.co.uk');
INSERT INTO emails (email) VALUES ('cubilia.Curae.Phasellus@turpis.co.uk');
INSERT INTO emails (email) VALUES ('Suspendisse.commodo@pedePraesenteu.edu');
INSERT INTO emails (email) VALUES ('imperdiet@arcu.co.uk');
INSERT INTO emails (email) VALUES ('eleifend@mauriselitdictum.co.uk');
INSERT INTO emails (email) VALUES ('lorem.sit.amet@ametconsectetuer.org');
INSERT INTO emails (email) VALUES ('arcu@Proinnisl.ca');
INSERT INTO emails (email) VALUES ('ipsum.primis@SuspendisseduiFusce.ca');
INSERT INTO emails (email) VALUES ('et@magnanecquam.net');
INSERT INTO emails (email) VALUES ('massa.Vestibulum.accumsan@ante.org');
INSERT INTO emails (email) VALUES ('commodo.ipsum.Suspendisse@acmattisvelit.ca');
INSERT INTO emails (email) VALUES ('dui.lectus@temporarcu.ca');
INSERT INTO emails (email) VALUES ('Vivamus.nibh.dolor@at.ca');
INSERT INTO emails (email) VALUES ('molestie@necmetusfacilisis.ca');
INSERT INTO emails (email) VALUES ('ipsum.dolor@sedhendrerita.ca');
INSERT INTO emails (email) VALUES ('tempus@aliquam.edu');
INSERT INTO emails (email) VALUES ('Curabitur.massa.Vestibulum@famesac.co.uk');
INSERT INTO emails (email) VALUES ('eget.ipsum@lectus.co.uk');
INSERT INTO emails (email) VALUES ('sapien@interdum.com');
INSERT INTO emails (email) VALUES ('mi.fringilla.mi@nibhAliquamornare.edu');
INSERT INTO emails (email) VALUES ('ornare.egestas.ligula@Fuscefeugiat.ca');
INSERT INTO emails (email) VALUES ('id.ante.dictum@ametrisusDonec.edu');
INSERT INTO emails (email) VALUES ('magna.a@inmagna.net');
INSERT INTO emails (email) VALUES ('Curae.Donec@Curabiturdictum.co.uk');
INSERT INTO emails (email) VALUES ('urna.Vivamus.molestie@PhasellusornareFusce.co.uk');
INSERT INTO emails (email) VALUES ('Integer@ipsum.co.uk');
INSERT INTO emails (email) VALUES ('at.pede@lorem.ca');
INSERT INTO emails (email) VALUES ('eu.tellus@cursusluctusipsum.co.uk');
INSERT INTO emails (email) VALUES ('dis.parturient.montes@Fuscediam.ca');
INSERT INTO emails (email) VALUES ('in.hendrerit@cursusluctus.org');
INSERT INTO emails (email) VALUES ('velit.justo.nec@arcu.net');
INSERT INTO emails (email) VALUES ('malesuada@necmetusfacilisis.org');
INSERT INTO emails (email) VALUES ('enim@suscipitnonummy.org');
INSERT INTO emails (email) VALUES ('sit.amet@hendrerit.ca');
INSERT INTO emails (email) VALUES ('Nunc@molestiearcuSed.net');
INSERT INTO emails (email) VALUES ('luctus.et.ultrices@ategestasa.co.uk');
INSERT INTO emails (email) VALUES ('lorem.semper@DonecnibhQuisque.net');
INSERT INTO emails (email) VALUES ('a.aliquet@nullaIn.net');
INSERT INTO emails (email) VALUES ('gravida@interdumligula.co.uk');
INSERT INTO emails (email) VALUES ('pede.ultrices.a@sem.net');
INSERT INTO emails (email) VALUES ('Nunc.laoreet@consectetuer.edu');
INSERT INTO emails (email) VALUES ('dictum.cursus.Nunc@ultriciesdignissim.net');
INSERT INTO emails (email) VALUES ('cursus@magnisdis.edu');
INSERT INTO emails (email) VALUES ('velit.in.aliquet@Nulla.co.uk');
INSERT INTO emails (email) VALUES ('aliquet.diam.Sed@pedeCrasvulputate.edu');
INSERT INTO emails (email) VALUES ('augue.ut.lacus@risusodio.edu');
INSERT INTO emails (email) VALUES ('Curabitur.dictum@quamvelsapien.org');
INSERT INTO emails (email) VALUES ('commodo.auctor@ullamcorpereueuismod.ca');
INSERT INTO emails (email) VALUES ('eget.metus.In@dui.co.uk');
INSERT INTO emails (email) VALUES ('orci@Fuscealiquamenim.edu');
INSERT INTO emails (email) VALUES ('a.sollicitudin.orci@orciin.ca');
INSERT INTO emails (email) VALUES ('libero.at@sociosqu.co.uk');
INSERT INTO emails (email) VALUES ('ut.pharetra@eleifendnec.co.uk');
INSERT INTO emails (email) VALUES ('auctor.odio.a@mitemporlorem.co.uk');
INSERT INTO emails (email) VALUES ('pharetra@sagittislobortis.com');
INSERT INTO emails (email) VALUES ('interdum.ligula.eu@erat.co.uk');
INSERT INTO emails (email) VALUES ('at@anteiaculis.org');
INSERT INTO emails (email) VALUES ('sem.magna@lacusQuisque.ca');
INSERT INTO emails (email) VALUES ('Ut@ultricessit.org');
INSERT INTO emails (email) VALUES ('Aliquam.erat@rhoncusNullamvelit.org');
INSERT INTO emails (email) VALUES ('dolor.egestas@magnaNamligula.edu');
INSERT INTO emails (email) VALUES ('est.arcu@Duisrisusodio.com');
INSERT INTO emails (email) VALUES ('vel.lectus@auctor.com');
INSERT INTO emails (email) VALUES ('elit.pharetra.ut@facilisi.co.uk');
INSERT INTO emails (email) VALUES ('dictum@vehicula.org');
INSERT INTO emails (email) VALUES ('quam.vel.sapien@nonhendrerit.edu');
INSERT INTO emails (email) VALUES ('egestas.urna@euarcuMorbi.edu');
INSERT INTO emails (email) VALUES ('iaculis.aliquet@euligula.com');
INSERT INTO emails (email) VALUES ('Quisque.ornare.tortor@ac.com');
INSERT INTO emails (email) VALUES ('et.malesuada@vulputateveliteu.net');
INSERT INTO emails (email) VALUES ('feugiat.Lorem.ipsum@porttitorvulputate.co.uk');
INSERT INTO emails (email) VALUES ('arcu.Vestibulum.ante@Nullamnisl.net');
INSERT INTO emails (email) VALUES ('pellentesque.Sed.dictum@Pellentesquehabitant.net');
INSERT INTO emails (email) VALUES ('Donec.egestas@euturpisNulla.co.uk');
INSERT INTO emails (email) VALUES ('in.aliquet.lobortis@ornare.com');
INSERT INTO emails (email) VALUES ('sem.eget@tempor.co.uk');
INSERT INTO emails (email) VALUES ('vitae.dolor.Donec@facilisisSuspendisse.ca');
INSERT INTO emails (email) VALUES ('eros.turpis.non@auctor.ca');
INSERT INTO emails (email) VALUES ('g.a95@hotmail.com');
INSERT INTO emails (email) VALUES ('vladimirputin@soyyo.com');


--Bancos
INSERT INTO bancos (banco) VALUES ('BANCO DE VENEZUELA');
INSERT INTO bancos (banco) VALUES ('BANESCO');
INSERT INTO bancos (banco) VALUES ('MERCANTIL');
INSERT INTO bancos (banco) VALUES ('BANCARIBE');
INSERT INTO bancos (banco) VALUES ('BANK OF AMERICA');
INSERT INTO bancos (banco) VALUES ('EL PROPIO');
INSERT INTO bancos (banco) VALUES ('BBVA CONTINENTAL');
INSERT INTO bancos (banco) VALUES ('MI BANCO');
INSERT INTO bancos (banco) VALUES ('INTERBANK');
INSERT INTO bancos (banco) VALUES ('BANCO DE COMEMRCIO');
INSERT INTO bancos (banco) VALUES ('BANCO DE COLOMBIA');
INSERT INTO bancos (banco) VALUES ('BANCO CENCOSUD');
INSERT INTO bancos (banco) VALUES ('BANCO DE LOS ANDES');
INSERT INTO bancos (banco) VALUES ('INCASUR');
INSERT INTO bancos (banco) VALUES ('BANCO DE RUSIA');
INSERT INTO bancos (banco) VALUES ('BANCO CARONÍ');
INSERT INTO bancos (banco) VALUES ('BANCORO');
INSERT INTO bancos (banco) VALUES ('BANPRO');
INSERT INTO bancos (banco) VALUES ('BANCO EXTERIOR');
INSERT INTO bancos (banco) VALUES ('BANCO CHCHPOW');