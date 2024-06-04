CREATE TABLE usuario(
	id int auto_increment primary key,
    nombre_de_usuario varchar(50),
    contrasena varchar(50),
    nombre varchar(50),
    apellido varchar(50),
    ano_de_nacimiento year(4),
    sexo ENUM('Femenino', 'Masculino', 'Prefiero no cargarlo'),
    mail varchar(50),
    foto_de_perfil varchar(50),
    pais varchar(50),
    ciudad varchar(50),
    cuenta_verificada boolean,
    hash_activacion varchar(500)
);

CREATE TABLE administrador(
	 id int,
	constraint primary key (id),
    foreign key (id) references usuario(id)
);

CREATE TABLE editor(
	id int,
	constraint primary key (id),
    foreign key (id) references usuario(id)
);

CREATE TABLE jugador(
	id int,
    constraint primary key (id),
    foreign key (id) references usuario(id)
);

CREATE TABLE pregunta(
	id int auto_increment primary key,
    pregunta varchar(150),
    categoría ENUM('Geografía', 'Ciencia', 'Historia', 'Deporte', 'Arte', 'Entretenimiento')
);

CREATE TABLE respuesta(
	id int auto_increment primary key,
	respuesta varchar(150),
	es_la_correcta boolean,
	pregunta int references pregunta(id)
  );
  
  CREATE TABLE estadistica_pregunta(
	pregunta int,
    veces_que_salio int,
    dificultad decimal(2),
    ultima_vez_que_salio date,
    constraint primary key (pregunta),
    foreign key (pregunta) references pregunta(id)
  );

CREATE TABLE partida (
	id int auto_increment primary key,
	puntaje int,
	jugador int references jugador(id)
);

CREATE TABLE partida_pregunta (
	partida int,
    pregunta int,
    se_respondio_bien boolean,
    constraint primary key (partida, pregunta),
    foreign key (partida) references partida(id),
    foreign key (pregunta) references pregunta(id)
);

INSERT INTO pregunta (pregunta, categoría) VALUES
('¿Cuál es la capital de Francia?', 'Geografía'),
('¿Quién formuló la teoría de la relatividad?', 'Ciencia'),
('¿En qué año comenzó la Segunda Guerra Mundial?', 'Historia'),
('¿Cuál es el deporte nacional de Japón?', 'Deporte'),
('¿Quién pintó la Mona Lisa?', 'Arte'),
('¿Cuál es el nombre del actor que interpreta a Iron Man en el MCU?', 'Entretenimiento'),
('¿Cuál es el río más largo del mundo?', 'Geografía'),
('¿Qué gas es esencial para la respiración humana?', 'Ciencia'),
('¿Quién fue el primer presidente de Estados Unidos?', 'Historia'),
('¿En qué deporte se utiliza una raqueta?', 'Deporte'),
('¿Quién es el autor de "El Quijote"?', 'Arte'),
('¿Cuál es la serie de televisión con más temporadas?', 'Entretenimiento'),
('¿Cuál es el país más grande del mundo?', 'Geografía'),
('¿Cuál es el símbolo químico del oro?', 'Ciencia'),
('¿En qué año llegó el hombre a la Luna?', 'Historia'),
('¿Qué deporte se juega con un bate y una pelota?', 'Deporte'),
('¿Quién pintó "La última cena"?', 'Arte'),
('¿Qué película ganó el Óscar a la mejor película en 1994?', 'Entretenimiento'),
('¿Cuál es el desierto más grande del mundo?', 'Geografía'),
('¿Cuál es el planeta más grande del sistema solar?', 'Ciencia'),
('¿Quién descubrió América?', 'Historia'),
('¿Cuántos jugadores hay en un equipo de fútbol?', 'Deporte'),
('¿Quién escribió "Romeo y Julieta"?', 'Arte'),
('¿Cuál es el nombre del mago protagonista en "Harry Potter"?', 'Entretenimiento'),
('¿Cuál es la montaña más alta del mundo?', 'Geografía'),
('¿Cuál es el elemento químico más abundante en el universo?', 'Ciencia'),
('¿En qué año terminó la Primera Guerra Mundial?', 'Historia'),
('¿Qué deporte se juega en el Wimbledon?', 'Deporte'),
('¿Quién pintó "La noche estrellada"?', 'Arte'),
('¿Cuál es la canción más famosa de Queen?', 'Entretenimiento'),
('¿Cuál es el océano más grande del mundo?', 'Geografía'),
('¿Quién desarrolló la teoría de la evolución?', 'Ciencia'),
('¿En qué año cayó el Muro de Berlín?', 'Historia'),
('¿Cuál es el país con la mayor cantidad de Copas del Mundo de fútbol?', 'Deporte'),
('¿Quién es el escultor de "El David"?', 'Arte'),
('¿Cuál es la película más taquillera de todos los tiempos?', 'Entretenimiento'),
('¿Cuál es el continente más grande?', 'Geografía'),
('¿Qué es H2O?', 'Ciencia'),
('¿Quién fue el emperador de Francia en 1804?', 'Historia'),
('¿Qué deporte se juega en la NBA?', 'Deporte'),
('¿Quién pintó "Guernica"?', 'Arte'),
('¿Cuál es el nombre del villano en "Los Vengadores"?', 'Entretenimiento'),
('¿Cuál es el río más largo de África?', 'Geografía'),
('¿Qué órgano bombea la sangre en el cuerpo humano?', 'Ciencia'),
('¿Quién fue el primer emperador romano?', 'Historia'),
('¿En qué deporte se utilizan las bicicletas?', 'Deporte'),
('¿Quién escribió "Cien años de soledad"?', 'Arte'),
('¿Cuál es la serie de televisión sobre un químico convertido en fabricante de drogas?', 'Entretenimiento');

INSERT INTO respuesta (respuesta, es_la_correcta, pregunta) VALUES
('Paris', TRUE, 1),
('Londres', FALSE, 1),
('Madrid', FALSE, 1),
('Roma', FALSE, 1),

('Albert Einstein', TRUE, 2),
('Isaac Newton', FALSE, 2),
('Galileo Galilei', FALSE, 2),
('Nikola Tesla', FALSE, 2),

('1939', TRUE, 3),
('1941', FALSE, 3),
('1935', FALSE, 3),
('1945', FALSE, 3),

('Sumo', TRUE, 4),
('Karate', FALSE, 4),
('Judo', FALSE, 4),
('Béisbol', FALSE, 4),

                                                                ('Leonardo da Vinci', TRUE, 5),
                                                                ('Vincent van Gogh', FALSE, 5),
                                                                ('Pablo Picasso', FALSE, 5),
                                                                ('Claude Monet', FALSE, 5),

                                                                ('Robert Downey Jr.', TRUE, 6),
                                                                ('Chris Evans', FALSE, 6),
                                                                ('Mark Ruffalo', FALSE, 6),
                                                                ('Chris Hemsworth', FALSE, 6),

                                                                ('Amazonas', TRUE, 7),
                                                                ('Nilo', FALSE, 7),
                                                                ('Misisipi', FALSE, 7),
                                                                ('Yangtsé', FALSE, 7),

                                                                ('Oxígeno', TRUE, 8),
                                                                ('Nitrógeno', FALSE, 8),
                                                                ('Hidrógeno', FALSE, 8),
                                                                ('Dióxido de Carbono', FALSE, 8),

                                                                ('George Washington', TRUE, 9),
                                                                ('Thomas Jefferson', FALSE, 9),
                                                                ('Abraham Lincoln', FALSE, 9),
                                                                ('John Adams', FALSE, 9),

                                                                ('Tenis', TRUE, 10),
                                                                ('Fútbol', FALSE, 10),
                                                                ('Baloncesto', FALSE, 10),
                                                                ('Natación', FALSE, 10),

                                                                ('Miguel de Cervantes', TRUE, 11),
                                                                ('Gabriel García Márquez', FALSE, 11),
                                                                ('Julio Cortázar', FALSE, 11),
                                                                ('Mario Vargas Llosa', FALSE, 11),

                                                                ('Los Simpson', TRUE, 12),
                                                                ('Friends', FALSE, 12),
                                                                ('Breaking Bad', FALSE, 12),
                                                                ('Game of Thrones', FALSE, 12),

                                                                ('Rusia', TRUE, 13),
                                                                ('Canadá', FALSE, 13),
                                                                ('China', FALSE, 13),
                                                                ('Estados Unidos', FALSE, 13),

                                                                ('Au', TRUE, 14),
                                                                ('Ag', FALSE, 14),
                                                                ('Fe', FALSE, 14),
                                                                ('Hg', FALSE, 14),

                                                                ('1969', TRUE, 15),
                                                                ('1965', FALSE, 15),
                                                                ('1970', FALSE, 15),
                                                                ('1975', FALSE, 15),

                                                                ('Béisbol', TRUE, 16),
                                                                ('Fútbol', FALSE, 16),
                                                                ('Baloncesto', FALSE, 16),
                                                                ('Críquet', FALSE, 16),

                                                                ('Leonardo da Vinci', TRUE, 17),
                                                                ('Michelangelo', FALSE, 17),
                                                                ('Raphael', FALSE, 17),
                                                                ('Donatello', FALSE, 17),

                                                                ('Forrest Gump', TRUE, 18),
                                                                ('Pulp Fiction', FALSE, 18),
                                                                ('The Shawshank Redemption', FALSE, 18),
                                                                ('The Lion King', FALSE, 18),

                                                                ('Sahara', TRUE, 19),
                                                                ('Gobi', FALSE, 19),
                                                                ('Kalahari', FALSE, 19),
                                                                ('Patagonia', FALSE, 19),

                                                                ('Júpiter', TRUE, 20),
                                                                ('Saturno', FALSE, 20),
                                                                ('Marte', FALSE, 20),
                                                                ('Neptuno', FALSE, 20),

                                                                ('Cristóbal Colón', TRUE, 21),
                                                                ('Américo Vespucio', FALSE, 21),
                                                                ('Fernando de Magallanes', FALSE, 21),
                                                                ('Hernán Cortés', FALSE, 21),

                                                                ('11', TRUE, 22),
                                                                ('9', FALSE, 22),
                                                                ('10', FALSE, 22),
                                                                ('12', FALSE, 22),

                                                                ('William Shakespeare', TRUE, 23),
                                                                ('Charles Dickens', FALSE, 23),
                                                                ('Jane Austen', FALSE, 23),
                                                                ('Mark Twain', FALSE, 23),

                                                                ('Harry Potter', TRUE, 24),
                                                                ('Hermione Granger', FALSE, 24),
                                                                ('Ron Weasley', FALSE, 24),
                                                                ('Albus Dumbledore', FALSE, 24),

                                                                ('Everest', TRUE, 25),
                                                                ('K2', FALSE, 25),
                                                                ('Kangchenjunga', FALSE, 25),
                                                                ('Lhotse', FALSE, 25),

                                                                ('Hidrógeno', TRUE, 26),
                                                                ('Oxígeno', FALSE, 26),
                                                                ('Carbono', FALSE, 26),
                                                                ('Helio', FALSE, 26),

                                                                ('1918', TRUE, 27),
                                                                ('1917', FALSE, 27),
                                                                ('1916', FALSE, 27),
                                                                ('1919', FALSE, 27),

                                                                ('Tenis', TRUE, 28),
                                                                ('Fútbol', FALSE, 28),
                                                                ('Baloncesto', FALSE, 28),
                                                                ('Golf', FALSE, 28),

                                                                ('Vincent van Gogh', TRUE, 29),
                                                                ('Pablo Picasso', FALSE, 29),
                                                                ('Claude Monet', FALSE, 29),
                                                                ('Salvador Dalí', FALSE, 29),

                                                                ('Bohemian Rhapsody', TRUE, 30),
                                                                ('We Will Rock You', FALSE, 30),
                                                                ('We Are the Champions', FALSE, 30),
                                                                ('Another One Bites the Dust', FALSE, 30),

                                                                ('Pacífico', TRUE, 31),
                                                                ('Atlántico', FALSE, 31),
                                                                ('Índico', FALSE, 31),
                                                                ('Ártico', FALSE, 31),

                                                                ('Charles Darwin', TRUE, 32),
                                                                ('Isaac Newton', FALSE, 32),
                                                                ('Albert Einstein', FALSE, 32),
                                                                ('Galileo Galilei', FALSE, 32),

                                                                ('1989', TRUE, 33),
                                                                ('1987', FALSE, 33),
                                                                ('1990', FALSE, 33),
                                                                ('1991', FALSE, 33),

                                                                ('Brasil', TRUE, 34),
                                                                ('Alemania', FALSE, 34),
                                                                ('Italia', FALSE, 34),
                                                                ('Argentina', FALSE, 34),

                                                                ('Michelangelo', TRUE, 35),
                                                                ('Donatello', FALSE, 35),
                                                                ('Raphael', FALSE, 35),
                                                                ('Leonardo da Vinci', FALSE, 35),

                                                                ('Avatar', TRUE, 36),
                                                                ('Avengers: Endgame', FALSE, 36),
                                                                ('Titanic', FALSE, 36),
                                                                ('Star Wars: The Force Awakens', FALSE, 36),

                                                                ('Asia', TRUE, 37),
                                                                ('África', FALSE, 37),
                                                                ('América del Norte', FALSE, 37),
                                                                ('Europa', FALSE, 37),

                                                                ('Agua', TRUE, 38),
                                                                ('Oxígeno', FALSE, 38),
                                                                ('Hidrógeno', FALSE, 38),
                                                                ('Helio', FALSE, 38),

                                                                ('Napoleón Bonaparte', TRUE, 39),
                                                                ('Luis XIV', FALSE, 39),
                                                                ('Carlos V', FALSE, 39),
                                                                ('Francisco I', FALSE, 39),

                                                                ('Baloncesto', TRUE, 40),
                                                                ('Fútbol', FALSE, 40),
                                                                ('Béisbol', FALSE, 40),
                                                                ('Hockey', FALSE, 40),

                                                                ('Pablo Picasso', TRUE, 41),
                                                                ('Salvador Dalí', FALSE, 41),
                                                                ('Joan Miró', FALSE, 41),
                                                                ('Diego Velázquez', FALSE, 41),

                                                                ('Thanos', TRUE, 42),
                                                                ('Loki', FALSE, 42),
                                                                ('Ultron', FALSE, 42),
                                                                ('Red Skull', FALSE, 42),

                                                                ('Nilo', TRUE, 43),
                                                                ('Congo', FALSE, 43),
                                                                ('Zambeze', FALSE, 43),
                                                                ('Níger', FALSE, 43),

                                                                ('Corazón', TRUE, 44),
                                                                ('Pulmones', FALSE, 44),
                                                                ('Hígado', FALSE, 44),
                                                                ('Riñones', FALSE, 44),

                                                                ('Augusto', TRUE, 45),
                                                                ('Julio César', FALSE, 45),
                                                                ('Nerón', FALSE, 45),
                                                                ('Calígula', FALSE, 45),

                                                                ('Ciclismo', TRUE, 46),
                                                                ('Atletismo', FALSE, 46),
                                                                ('Natación', FALSE, 46),
                                                                ('Boxeo', FALSE, 46),

                                                                ('Gabriel García Márquez', TRUE, 47),
                                                                ('Jorge Luis Borges', FALSE, 47),
                                                                ('Pablo Neruda', FALSE, 47),
                                                                ('Octavio Paz', FALSE, 47),

                                                                ('Breaking Bad', TRUE, 48),
                                                                ('The Sopranos', FALSE, 48),
                                                                ('The Wire', FALSE, 48),
                                                                ('Mad Men', FALSE, 48);
                                               
INSERT INTO pregunta (pregunta, categoría) VALUES
('¿Cuál es la ciudad más poblada del mundo?', 'Geografía'),
('¿Qué partícula subatómica tiene carga negativa?', 'Ciencia'),
('¿Quién fue el primer hombre en orbitar la Tierra?', 'Historia'),
('¿Qué deporte se juega con un disco en lugar de una pelota?', 'Deporte'),
('¿Quién compuso la ópera "La flauta mágica"?', 'Arte'),
('¿Cuál es el nombre del protagonista de "El Señor de los Anillos"?', 'Entretenimiento'),
('¿Cuál es la segunda lengua más hablada en el mundo?', 'Geografía'),
('¿Cuál es el símbolo químico del sodio?', 'Ciencia'),
('¿Quién fue el líder del Imperio Mongol?', 'Historia'),
('¿En qué deporte se usa un "birdie"?', 'Deporte'),
('¿Quién pintó "La persistencia de la memoria"?', 'Arte'),
('¿Qué serie de televisión es conocida por la frase "Winter is Coming"?', 'Entretenimiento'),
('¿Cuál es el país más pequeño del mundo?', 'Geografía'),
('¿Qué gas se utiliza en los globos de helio?', 'Ciencia'),
('¿En qué año se firmó la Declaración de Independencia de Estados Unidos?', 'Historia'),
('¿Qué deporte se practica en el Tour de Francia?', 'Deporte'),
('¿Quién es el autor de "La Odisea"?', 'Arte'),
('¿Cuál fue la primera película de animación en ganar un Óscar?', 'Entretenimiento'),
('¿Cuál es la isla más grande del mundo?', 'Geografía'),
('¿Qué elemento químico tiene el símbolo K?', 'Ciencia'),
('¿Cuál es el nombre del río que atraviesa Egipto?', 'Geografía'),
('¿Qué tipo de partícula es un fotón?', 'Ciencia'),
('¿Quién fue el primer presidente de Sudáfrica después del apartheid?', 'Historia'),
('¿En qué deporte se utiliza una tabla y una vela?', 'Deporte'),
('¿Quién es el autor de "La Divina Comedia"?', 'Arte'),
('¿Cuál es el nombre del detective en las novelas de Arthur Conan Doyle?', 'Entretenimiento'),
('¿Cuál es el país con más islas en el mundo?', 'Geografía'),
('¿Qué planeta es conocido como el Planeta Rojo?', 'Ciencia'),
('¿Quién fue el primer emperador de China?', 'Historia'),
('¿En qué deporte se compite en el "Tour de Francia"?', 'Deporte'),
('¿Quién pintó "El grito"?', 'Arte'),
('¿Cuál es el nombre del protagonista en la serie "Breaking Bad"?', 'Entretenimiento'),
('¿Cuál es el lago más profundo del mundo?', 'Geografía'),
('¿Qué metal es líquido a temperatura ambiente?', 'Ciencia'),
('¿En qué año comenzó la Revolución Francesa?', 'Historia'),
('¿Cuál es el deporte nacional de Canadá?', 'Deporte'),
('¿Quién escribió "1984"?', 'Arte'),
('¿Qué película de Disney tiene un personaje llamado Simba?', 'Entretenimiento'),
('¿Cuál es la ciudad capital de Australia?', 'Geografía'),
('¿Cuál es el gas más abundante en la atmósfera de la Tierra?', 'Ciencia'),
('¿Quién fue el último zar de Rusia?', 'Historia'),
('¿Qué deporte se juega en Wimbledon?', 'Deporte'),
('¿Quién es el autor de "Crimen y Castigo"?', 'Arte'),
('¿Cuál es el nombre del parque de atracciones en Anaheim, California?', 'Entretenimiento'),
('¿Cuál es el país más densamente poblado del mundo?', 'Geografía'),
('¿Cuál es el nombre común del ácido acético?', 'Ciencia'),
('¿En qué año se produjo el primer vuelo de los hermanos Wright?', 'Historia'),
('¿Cuál es el deporte más popular en India?', 'Deporte'),
('¿Quién pintó "La joven de la perla"?', 'Arte'),
('¿Qué banda lanzó el álbum "The Dark Side of the Moon"?', 'Entretenimiento'),
('¿Cuál es el idioma oficial de Brasil?', 'Geografía'),
('¿Qué partícula subatómica tiene una carga negativa?', 'Ciencia'),
('¿Quién escribió "La Ilíada" y "La Odisea"?', 'Historia'),
('¿En qué deporte se utiliza un balón y una canasta?', 'Deporte'),
('¿Quién es el autor de "El Principito"?', 'Arte'),
('¿Cuál es el nombre del planeta donde vive Yoda en "Star Wars"?', 'Entretenimiento'),
('¿Qué país tiene la mayor población del mundo?', 'Geografía'),
('¿Qué vitamina se obtiene principalmente del sol?', 'Ciencia'),
('¿Quién fue el primer ministro del Reino Unido durante la Segunda Guerra Mundial?', 'Historia'),
('¿En qué deporte se utiliza un disco y un palo?', 'Deporte'),
('¿Quién pintó "Las Meninas"?', 'Arte'),
('¿Cuál es el nombre del mago oscuro en "El Señor de los Anillos"?', 'Entretenimiento'),
('¿Cuál es el continente más pequeño en términos de superficie?', 'Geografía'),
('¿Qué elemento químico tiene el símbolo He?', 'Ciencia'),
('¿Quién fue la primera mujer en volar sola a través del Atlántico?', 'Historia'),
('¿En qué deporte se compite en los "X Games"?', 'Deporte'),
('¿Quién es el autor de "Orgullo y Prejuicio"?', 'Arte'),
('¿Cuál es el nombre del villano en la serie "Harry Potter"?', 'Entretenimiento'),
('¿Cuál es el país más grande de América del Sur?', 'Geografía'),
('¿Qué gas es conocido como el gas de la risa?', 'Ciencia'),
('¿Quién fue el principal líder de la Revolución Cubana?', 'Historia'),
('¿En qué deporte se usa una pelota ovalada?', 'Deporte'),
('¿Quién escribió "El Retrato de Dorian Gray"?', 'Arte'),
('¿Cuál es el nombre del parque temático en París relacionado con Disney?', 'Entretenimiento'),
('¿Cuál es el río más largo de Europa?', 'Geografía'),
('¿Qué elemento químico tiene el símbolo K?', 'Ciencia'),
('¿Quién fue el presidente de los Estados Unidos durante la Guerra Civil?', 'Historia'),
('¿En qué deporte se utiliza un arco y flechas?', 'Deporte'),
('¿Quién pintó "La persistencia de la memoria"?', 'Arte'),
('¿Cuál es el nombre del protagonista en la serie "Stranger Things"?', 'Entretenimiento'),
('¿Cuál es la moneda oficial de Japón?', 'Geografía'),
('¿Qué científico descubrió la penicilina?', 'Ciencia'),
('¿En qué año se firmó la Declaración de Independencia de los Estados Unidos?', 'Historia'),
('¿Qué deporte se juega con un volante y una raqueta?', 'Deporte'),
('¿Quién es el autor de "El viejo y el mar"?', 'Arte'),
('¿Cuál es el nombre del dragón en "El Hobbit"?', 'Entretenimiento'),
('¿Cuál es el país más pequeño del mundo?', 'Geografía'),
('¿Qué planeta es conocido como el planeta rojo?', 'Ciencia'),
('¿Quién fue el primer presidente de Sudáfrica elegido democráticamente?', 'Historia'),
('¿En qué deporte se utiliza un balón y una red alta?', 'Deporte'),
('¿Quién pintó "El grito"?', 'Arte'),
('¿Cuál es el nombre del barco en "Titanic"?', 'Entretenimiento'),
('¿Cuál es el desierto más grande de América del Norte?', 'Geografía'),
('¿Qué elemento químico tiene el símbolo Na?', 'Ciencia'),
('¿Quién fue el líder soviético durante la Segunda Guerra Mundial?', 'Historia'),
('¿En qué deporte se compite en el Tour de Francia?', 'Deporte'),
('¿Quién es el autor de "Crimen y castigo"?', 'Arte'),
('¿Cuál es el nombre del villano en la serie "Batman"?', 'Entretenimiento');


INSERT INTO respuesta (respuesta, es_la_correcta, pregunta) VALUES
('Tokio', TRUE, 49),
('Nueva York', FALSE, 49),
('Delhi', FALSE, 49),
('Shanghai', FALSE, 49),

('Electrón', TRUE, 50),
('Protón', FALSE, 50),
('Neutrón', FALSE, 50),
('Quark', FALSE, 50),

('Yuri Gagarin', TRUE, 51),
('Neil Armstrong', FALSE, 51),
('Buzz Aldrin', FALSE, 51),
('John Glenn', FALSE, 51),

('Hockey sobre hielo', TRUE, 52),
('Balonmano', FALSE, 52),
('Lacrosse', FALSE, 52),
('Fútbol', FALSE, 52),

('Wolfgang Amadeus Mozart', TRUE, 53),
('Ludwig van Beethoven', FALSE, 53),
('Johann Sebastian Bach', FALSE, 53),
('Giuseppe Verdi', FALSE, 53),

('Frodo Bolsón', TRUE, 54),
('Gandalf', FALSE, 54),
('Aragorn', FALSE, 54),
('Legolas', FALSE, 54),

('Español', TRUE, 55),
('Inglés', FALSE, 55),
('Chino mandarín', FALSE, 55),
('Hindú', FALSE, 55),

('Na', TRUE, 56),
('S', FALSE, 56),
('N', FALSE, 56),
('Si', FALSE, 56),

('Genghis Khan', TRUE, 57),
('Tamerlán', FALSE, 57),
('Kublai Khan', FALSE, 57),
('Atila', FALSE, 57),

('Bádminton', TRUE, 58),
('Tenis', FALSE, 58),
('Golf', FALSE, 58),
('Ping-pong', FALSE, 58),

('Salvador Dalí', TRUE, 59),
('Pablo Picasso', FALSE, 59),
('Claude Monet', FALSE, 59),
('Edvard Munch', FALSE, 59),

('Juego de Tronos', TRUE, 60),
('Breaking Bad', FALSE, 60),
('Los Soprano', FALSE, 60),
('Mad Men', FALSE, 60),

('Ciudad del Vaticano', TRUE, 61),
('Mónaco', FALSE, 61),
('San Marino', FALSE, 61),
('Liechtenstein', FALSE, 61),

('Helio', TRUE, 62),
('Hidrógeno', FALSE, 62),
('Oxígeno', FALSE, 62),
('Nitrógeno', FALSE, 62),

('1776', TRUE, 63),
('1789', FALSE, 63),
('1812', FALSE, 63),
('1804', FALSE, 63),

('Ciclismo', TRUE, 64),
('Automovilismo', FALSE, 64),
('Motociclismo', FALSE, 64),
('Esquí', FALSE, 64),

('Homero', TRUE, 65),
('Virgilio', FALSE, 65),
('Sófocles', FALSE, 65),
('Eurípides', FALSE, 65),

('Blancanieves y los siete enanitos', TRUE, 66),
('La bella y la bestia', FALSE, 66),
('El rey león', FALSE, 66),
('Aladdin', FALSE, 66),

('Groenlandia', TRUE, 67),
('Nueva Guinea', FALSE, 67),
('Borneo', FALSE, 67),
('Madagascar', FALSE, 67),

('Potasio', TRUE, 68),
('Calcio', FALSE, 68),
('Hierro', FALSE, 68),
('Plomo', FALSE, 68),

('Nilo', TRUE, 69),
('Amazonas', FALSE, 69),
('Mississippi', FALSE, 69),
('Ganges', FALSE, 69),

('Bosón', FALSE, 70),
('Fermión', FALSE, 70),
('Quark', FALSE, 70),
('Partícula de luz', TRUE, 70),

('Nelson Mandela', TRUE, 71),
('Desmond Tutu', FALSE, 71),
('Thabo Mbeki', FALSE, 71),
('Jacob Zuma', FALSE, 71),

('Windsurf', TRUE, 72),
('Surf', FALSE, 72),
('Kitesurf', FALSE, 72),
('Esquí acuático', FALSE, 72),

('Dante Alighieri', TRUE, 73),
('Geoffrey Chaucer', FALSE, 73),
('John Milton', FALSE, 73),
('Homer', FALSE, 73),

('Sherlock Holmes', TRUE, 74),
('Hercule Poirot', FALSE, 74),
('Miss Marple', FALSE, 74),
('Sam Spade', FALSE, 74),

('Suecia', TRUE, 75),
('Indonesia', FALSE, 75),
('Filipinas', FALSE, 75),
('Noruega', FALSE, 75),

('Marte', TRUE, 76),
('Venus', FALSE, 76),
('Júpiter', FALSE, 76),
('Saturno', FALSE, 76),

('Qin Shi Huang', TRUE, 77),
('Kublai Khan', FALSE, 77),
('Emperador Wu', FALSE, 77),
('Yongle', FALSE, 77),

('Ciclismo', TRUE, 78),
('Automovilismo', FALSE, 78),
('Maratón', FALSE, 78),
('Esquí', FALSE, 78),

('Edvard Munch', TRUE, 79),
('Vincent van Gogh', FALSE, 79),
('Claude Monet', FALSE, 79),
('Gustav Klimt', FALSE, 79),

('Walter White', TRUE, 80),
('Jesse Pinkman', FALSE, 80),
('Hank Schrader', FALSE, 80),
('Saul Goodman', FALSE, 80),

('Lago Baikal', TRUE, 81),
('Lago Tanganica', FALSE, 81),
('Lago Superior', FALSE, 81),
('Lago Victoria', FALSE, 81),

('Mercurio', TRUE, 82),
('Plomo', FALSE, 82),
('Aluminio', FALSE, 82),
('Hierro', FALSE, 82),

('1789', TRUE, 83),
('1776', FALSE, 83),
('1799', FALSE, 83),
('1804', FALSE, 83),

('Hockey sobre hielo', TRUE, 84),
('Fútbol', FALSE, 84),
('Lacrosse', FALSE, 84),
('Curling', FALSE, 84),

('George Orwell', TRUE, 85),
('Aldous Huxley', FALSE, 85),
('Ray Bradbury', FALSE, 85),
('Kurt Vonnegut', FALSE, 85),

('El Rey León', TRUE, 86),
('La Bella y la Bestia', FALSE, 86),
('Aladdín', FALSE, 86),
('Mulan', FALSE, 86),

('Canberra', TRUE, 87),
('Sídney', FALSE, 87),
('Melbourne', FALSE, 87),
('Brisbane', FALSE, 87),

('Nitrógeno', TRUE, 88),
('Oxígeno', FALSE, 88),
('Argón', FALSE, 88),
('Dióxido de Carbono', FALSE, 88),

('Nicolás II', TRUE, 89),
('Pedro el Grande', FALSE, 89),
('Alejandro II', FALSE, 89),
('Iván el Terrible', FALSE, 89),

('Tenis', TRUE, 90),
('Críquet', FALSE, 90),
('Golf', FALSE, 90),
('Fútbol', FALSE, 90),

('Fiódor Dostoyevski', TRUE, 91),
('León Tolstói', FALSE, 91),
('Aleksandr Pushkin', FALSE, 91),
('Antón Chéjov', FALSE, 91),

('Disneyland', TRUE, 92),
('Universal Studios', FALSE, 92),
('SeaWorld', FALSE, 92),
('Magic Mountain', FALSE, 92),

('Mónaco', TRUE, 93),
('Singapur', FALSE, 93),
('Hong Kong', FALSE, 93),
('Ciudad del Vaticano', FALSE, 93),

('Vinagre', TRUE, 94),
('Alcohol', FALSE, 94),
('Glicerina', FALSE, 94),
('Metanol', FALSE, 94),

('1903', TRUE, 95),
('1899', FALSE, 95),
('1912', FALSE, 95),
('1920', FALSE, 95),

('Críquet', TRUE, 96),
('Hockey sobre césped', FALSE, 96),
('Kabaddi', FALSE, 96),
('Fútbol', FALSE, 96),

('Johannes Vermeer', TRUE, 97),
('Rembrandt', FALSE, 97),
('Jan van Eyck', FALSE, 97),
('Pieter Bruegel', FALSE, 97),

('Pink Floyd', TRUE, 98),
('The Beatles', FALSE, 98),
('Led Zeppelin', FALSE, 98),
('The Rolling Stones', FALSE, 98),

('Portugués', TRUE, 99),
('Español', FALSE, 99),
('Inglés', FALSE, 99),
('Francés', FALSE, 99),

('Electrón', TRUE, 100),
('Protón', FALSE, 100),
('Neutrón', FALSE, 100),
('Quark', FALSE, 100),

('Homero', TRUE, 101),
('Sófocles', FALSE, 101),
('Eurípides', FALSE, 101),
('Virgilio', FALSE, 101),

('Baloncesto', TRUE, 102),
('Fútbol', FALSE, 102),
('Voleibol', FALSE, 102),
('Rugby', FALSE, 102),

('Antoine de Saint-Exupéry', TRUE, 103),
('J.K. Rowling', FALSE, 103),
('Gabriel García Márquez', FALSE, 103),
('Ernest Hemingway', FALSE, 103),

('Dagobah', TRUE, 104),
('Tatooine', FALSE, 104),
('Naboo', FALSE, 104),
('Hoth', FALSE, 104),

('China', TRUE, 105),
('India', FALSE, 105),
('Estados Unidos', FALSE, 105),
('Indonesia', FALSE, 105),

('Vitamina D', TRUE, 106),
('Vitamina C', FALSE, 106),
('Vitamina A', FALSE, 106),
('Vitamina B12', FALSE, 106),

('Winston Churchill', TRUE, 107),
('Neville Chamberlain', FALSE, 107),
('Clement Attlee', FALSE, 107),
('Margaret Thatcher', FALSE, 107),

('Hockey sobre hielo', TRUE, 108),
('Lacrosse', FALSE, 108),
('Rugby', FALSE, 108),
('Béisbol', FALSE, 108),

('Diego Velázquez', TRUE, 109),
('Francisco Goya', FALSE, 109),
('El Greco', FALSE, 109),
('Bartolomé Esteban Murillo', FALSE, 109),

('Sauron', TRUE, 110),
('Saruman', FALSE, 110),
('Gollum', FALSE, 110),
('Smaug', FALSE, 110),

('Australia', TRUE, 111),
('Europa', FALSE, 111),
('Antártida', FALSE, 111),
('Sudamérica', FALSE, 111),

('Helio', TRUE, 112),
('Hidrógeno', FALSE, 112),
('Oxígeno', FALSE, 112),
('Carbono', FALSE, 112),

('Amelia Earhart', TRUE, 113),
('Harriet Quimby', FALSE, 113),
('Bessie Coleman', FALSE, 113),
('Valentina Tereshkova', FALSE, 113),

('Deportes extremos', TRUE, 114),
('Atletismo', FALSE, 114),
('Natación', FALSE, 114),
('Gimnasia', FALSE, 114),

('Jane Austen', TRUE, 115),
('Charlotte Brontë', FALSE, 115),
('Mary Shelley', FALSE, 115),
('Emily Brontë', FALSE, 115),

('Voldemort', TRUE, 116),
('Dumbledore', FALSE, 116),
('Severus Snape', FALSE, 116),
('Hagrid', FALSE, 116),

('Brasil', TRUE, 117),
('Argentina', FALSE, 117),
('Colombia', FALSE, 117),
('Perú', FALSE, 117),

('Óxido nitroso', TRUE, 118),
('Dióxido de carbono', FALSE, 118),
('Metano', FALSE, 118),
('Oxígeno', FALSE, 118),

('Fidel Castro', TRUE, 119),
('Che Guevara', FALSE, 119),
('Raúl Castro', FALSE, 119),
('Camilo Cienfuegos', FALSE, 119),

('Rugby', TRUE, 120),
('Baloncesto', FALSE, 120),
('Tenis', FALSE, 120),
('Golf', FALSE, 120),

('Oscar Wilde', TRUE, 121),
('Charles Dickens', FALSE, 121),
('Edgar Allan Poe', FALSE, 121),
('Mark Twain', FALSE, 121),

('Disneyland Paris', TRUE, 122),
('Disney World', FALSE, 122),
('Universal Studios Paris', FALSE, 122),
('Magic Kingdom Paris', FALSE, 122),

('Volga', TRUE, 123),
('Danubio', FALSE, 123),
('Rin', FALSE, 123),
('Elba', FALSE, 123),

('Potasio', TRUE, 124),
('Calcio', FALSE, 124),
('Krypton', FALSE, 124),
('Fósforo', FALSE, 124),

('Abraham Lincoln', TRUE, 125),
('George Washington', FALSE, 125),
('Thomas Jefferson', FALSE, 125),
('John Adams', FALSE, 125),

('Tiro con arco', TRUE, 126),
('Esgrima', FALSE, 126),
('Natación', FALSE, 126),
('Atletismo', FALSE, 126),

('Salvador Dalí', TRUE, 127),
('René Magritte', FALSE, 127),
('Max Ernst', FALSE, 127),
('Joan Miró', FALSE, 127),

('Eleven', TRUE, 128),
('Mike', FALSE, 128),
('Lucas', FALSE, 128),
('Dustin', FALSE, 128),

('Yen', TRUE, 129),
('Dólar', FALSE, 129),
('Euro', FALSE, 129),
('Peso', FALSE, 129),

('Alexander Fleming', TRUE, 130),
('Marie Curie', FALSE, 130),
('Louis Pasteur', FALSE, 130),
('Isaac Newton', FALSE, 130),

('1776', TRUE, 131),
('1783', FALSE, 131),
('1775', FALSE, 131),
('1781', FALSE, 131),

('Bádminton', TRUE, 132),
('Tenis', FALSE, 132),
('Voleibol', FALSE, 132),
('Squash', FALSE, 132),

('Ernest Hemingway', TRUE, 133),
('F. Scott Fitzgerald', FALSE, 133),
('Mark Twain', FALSE, 133),
('John Steinbeck', FALSE, 133),

('Smaug', TRUE, 134),
('Drogon', FALSE, 134),
('Fírnen', FALSE, 134),
('Glaurung', FALSE, 134),

('El Vaticano', TRUE, 135),
('Mónaco', FALSE, 135),
('San Marino', FALSE, 135),
('Liechtenstein', FALSE, 135),

('Marte', TRUE, 136),
('Júpiter', FALSE, 136),
('Saturno', FALSE, 136),
('Venus', FALSE, 136),

('Nelson Mandela', TRUE, 137),
('Desmond Tutu', FALSE, 137),
('F. W. de Klerk', FALSE, 137),
('Jacob Zuma', FALSE, 137),

('Voleibol', TRUE, 138),
('Tenis', FALSE, 138),
('Baloncesto', FALSE, 138),
('Balonmano', FALSE, 138),

('Edvard Munch', TRUE, 139),
('Gustav Klimt', FALSE, 139),
('Claude Monet', FALSE, 139),
('Vincent van Gogh', FALSE, 139),

('RMS Titanic', TRUE, 140),
('SS Titanic', FALSE, 140),
('HMS Titanic', FALSE, 140),
('MS Titanic', FALSE, 140),

('Desierto de Sonora', TRUE, 141),
('Desierto de Mojave', FALSE, 141),
('Desierto de Chihuahua', FALSE, 141),
('Desierto de Great Basin', FALSE, 141),

('Sodio', TRUE, 142),
('Nitrógeno', FALSE, 142),
('Neón', FALSE, 142),
('Níquel', FALSE, 142),

('Joseph Stalin', TRUE, 143),
('Vladimir Lenin', FALSE, 143),
('Leon Trotsky', FALSE, 143),
('Nikita Khrushchev', FALSE, 143),

('Ciclismo', TRUE, 144),
('Automovilismo', FALSE, 144),
('Atletismo', FALSE, 144),
('Motociclismo', FALSE, 144),

('Fyodor Dostoevsky', TRUE, 145),
('Leo Tolstoy', FALSE, 145),
('Anton Chekhov', FALSE, 145),
('Vladimir Nabokov', FALSE, 145),

('Joker', TRUE, 146),
('Penguin', FALSE, 146),
('Riddler', FALSE, 146),
('Two-Face', FALSE, 146);



