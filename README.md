🎵 Proyecto Music Stream: BBDD y Análisis Musical

Cliente Final: Music Stream

Objetivo: Integrar datos de Spotify y Last.fm para la creación de una base de datos relacional en MySQL y la ejecución de consultas analíticas para un estudio de mercado.

📝 Descripción del Proyecto

Este proyecto consiste en el desarrollo de una solución de datos para la empresa Music Stream. Se ha diseñado un flujo de trabajo para unificar información musical de dos fuentes distintas, permitiendo realizar un análisis estratégico del mercado actual.

Para cumplir con los requerimientos del cliente, los datos han sido filtrados bajo los siguientes criterios:

Ventana temporal: Lanzamientos de los últimos 5 años.

Géneros objetivo: Reggaeton, Hip-Hop, Rock, Indie y Pop.

El proceso incluye la lectura de datos en crudo (JSON), el enriquecimiento de la información mediante una API externa, la limpieza y normalización con Python (Pandas) y el almacenamiento final en un sistema de gestión de bases de datos relacionales (MySQL).

📂 Estructura del Repositorio

El proyecto se compone de tres notebooks principales y archivos de soporte para la gestión de datos y configuración.

Archivos de Configuración

.env: Archivo local destinado a almacenar de forma segura la clave de acceso (API_KEY) de Last.fm. Este archivo no se incluye en el repositorio por motivos de seguridad.

.gitignore: Configuración para excluir archivos sensibles (como el .env) y archivos temporales del sistema del control de versiones.

Archivos de Datos (.json)

datos_spotify.json: Dataset original con información base (ID, artista, canción, género y año). Ejemplo de estructura:

[
  {
    "id": "7AlYBA5M9FVXDqN31cbExE", 
    "artist_name": "Remedios Amaya", 
    "track_name": "El zarandeo", 
    "genre": "flamenco", 
    "year": 2000
  }
]


info_artistas.json: Dataset generado con los datos extraídos de la API de Last.fm. Incluye métricas de popularidad y relaciones de similitud. Ejemplo de estructura:

[
  {
    "name": "Pröz",
    "listeners": "10465",
    "playcount": "193643",
    "similares": ["444pluto", "Yati", "pink luu"]
  }
]


lista_artistas.json: Lista única de artistas generada tras la limpieza de Spotify (3.827 registros). Se utiliza para realizar las peticiones dirigidas a la API de Last.fm y cruzar los datos de oyentes y reproducciones.

Código y Ejecución (.ipynb)

obtencion_lista_artistas_spotify.ipynb: Realiza la carga inicial, filtrado por género/año y generación de la lista única de artistas.

obtencion_info_artistas_api.ipynb: Gestiona las peticiones a la API de Last.fm, procesa las respuestas (incluyendo listas de diccionarios anidadas) y consolida la información.

creacion_insercion_consultas.ipynb: Notebook final que realiza la conexión a MySQL, crea el esquema relacional, inserta los datos y ejecuta 12 consultas SQL de negocio.

🗄️ Modelo de Base de Datos

La base de datos se ha normalizado en 6 tablas relacionales:

artistas: Datos maestros del artista (nombre, oyentes y reproducciones).

generos_musicales: Catálogo de géneros musicales definidos en el estudio.

similares: artistas similares

canciones: Tabla intermedia para la relación N:M entre canciones y géneros.

artistas_similares: Mapeo de la red de similitud entre artistas según Last.fm.

cancion_artista: 
