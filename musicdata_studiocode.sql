CREATE SCHEMA IF NOT EXISTS musicdata_studiocode;

USE musicdata_studiocode;

CREATE TABLE IF NOT EXISTS artistas (
    id_artista INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    biografia LONGTEXT
);

CREATE TABLE IF NOT EXISTS generos_musicales (
    id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS artistas_similiares (
id_artista_similares INT PRIMARY KEY AUTO_INCREMENT,
nombre_similares VARCHAR(70) NOT NULL
 );
    
CREATE TABLE IF NOT EXISTS id_canciones (
id_cancion INT PRIMARY KEY AUTO_INCREMENT,
id_artista INT PRIMARY KEY,
titulo_cancion VARCHAR(70) NOT NULL,
id_genero INT NOT NULL,
año_lanzamiento YEAR,
CONSTRAINT fk_id_artista_artistas FOREIGN KEY (id_artista) REFERENCES artistas(id_artista) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT fk_id_generos_generos FOREIGN KEY (id_genero) REFERENCES generos_musicales(id_genero) ON DELETE RESTRICT ON UPDATE CASCADE
);

   
CREATE TABLE IF NOT EXISTS reproducciones_oyentes (
id_artista INT PRIMARY KEY,
id_cancion INT PRIMARY KEY,
numero_reproducciones INT NOT NULL,
numero_oyentes INT NOT NULL,
CONSTRAINT  fk_id_cancion_canciones FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS similares (
Id_artista INT PRIMARY KEY,
Id_artista_similares INT PRIMARY KEY,
CONSTRAINT fk_id_artista_artistas FOREIGN KEY (id_artista) REFERENCES artistas(id_artista) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT fk_id_artista_similar_artistas_similares FOREIGN KEY (id_artista_similar) REFERENCES artistas_similares(id_artista_similar) ON DELETE RESTRICT ON UPDATE CASCADE
);




    
    
    
    
    