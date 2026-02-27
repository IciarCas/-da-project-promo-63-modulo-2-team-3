# 🎵 Proyecto Music Stream: BBDD y Análisis Musical

**Cliente Final: Music Stream**

**Objetivo**: Integrar datos de Spotify y Last.fm para la creación de una base de datos relacional en MySQL y la ejecución de consultas analíticas para un estudio de mercado.

## 📝 De qué va este proyecto

En este proyecto hemos unido información musical de dos fuentes diferentes para crear nuestra propia base de datos desde cero. El cliente (Music Stream) solicitó un estudio de mercado enfocado en las tendencias actuales, por lo que filtramos los datos bajo los siguientes criterios:

- **Ventana temporal:** Lanzamientos de los últimos 5 años (2021-2025).

- **Géneros objetivo**: Reggaeton, Hip-Hop, Rock, Indie y Pop.

Para lograrlo, procesamos datos en formato JSON de Spotify, enriquecimos la información mediante la API de Last.fm, realizamos la limpieza con Pandas y automatizamos la carga en MySQL mediante Python.

## 📂 Estructura del Repositorio

El proyecto se compone de tres notebooks principales que deben ejecutarse secuencialmente:

### Archivos de Configuración

- **`.env`** - Archivo local para almacenar la API Key de Last.fm de forma segura. (No incluido en el repositorio).

- **`.gitignore`** - Archivo de configuración vital para la seguridad. Evita que se suba accidentalmente el archivo .env (que contiene la clave secreta) al repositorio público.

### Archivos de Datos (.json)

- **`datos_spotify.json`** - Dataset original con ID, nombre del artista, canción, género y año.

- **`info_artistas.json`** - Dataset enriquecido con los datos de Last.fm (oyentes, reproducciones y artistas similares).

- **`lista_artistas.json`** - Archivo intermedio con una lista única de 3.827 artistas. Se utiliza para cruzar los datos de Spotify con la API de Last.fm y obtener métricas de popularidad.

### Código y Pipeline (.ipynb)

- **`obtencion_lista_artistas_spotify.ipynb`** - Filtrado por género/año y limpieza de duplicados de la fuente Spotify.

- **`obtencion_info_artistas_api.ipynb`** - Conexión con la API de Last.fm y generación del dataset final enriquecido.

- **`creacion_insercion_consultas.ipynb`** - Creación del modelo relacional en MySQL, inserción de datos y ejecución del bloque analítico.

## 🗄️ Modelo de Base de Datos

El diseño se basa en un esquema relacional normalizado compuesto por 6 tablas:

- **artistas:** Información maestra (nombre, oyentes y reproducciones).

- **generos_musicales:** Catálogo de géneros del estudio.

- **similares:** Catálogo de artistas relacionados.

- **canciones:** Registro de pistas vinculadas a géneros y años.

- **artistas_similares:** Relación entre artistas y sus recomendaciones.

- **canciones_artistas:** Vínculo entre artistas y sus obras.

## 📊 Valor de Negocio: El Estudio de Mercado

A través de **9 consultas iniciales SQL**, el proyecto responde a preguntas estratégicas para Music Stream, destacando los siguientes hallazgos:

- **Rendimiento por artista** -> Identificación de los artistas con mayor número de canciones por año, así como aquellos con máximos niveles de oyentes y reproducciones totales.

- **Diversidad y alcance** -> Análisis de qué artistas abarcan mayor número de géneros y cuáles son los artistas similares que más se repiten en las recomendaciones de la API.

- **Dinámica del mercado** -> Determinación del año con mayor volumen de lanzamientos y la distribución de artistas por cada género musical.

- **Análisis de actividad y colaboración** -> Detección de artistas con mayor número de colaboraciones y estudio de la constancia de lanzamientos (identificando periodos de inactividad).

## 🛠️ Tecnologías Aplicadas

- Python 3: Lógica de integración y automatización.

- Pandas: Limpieza y transformación de estructuras de datos.

- Requests: Consumo de la API REST de Last.fm.

- MySQL & mysql-connector-python: Gestión de base de datos relacional.

##🚀 Cómo ejecutarlo en tu ordenador

### 1. Instala las librerías en caso de que alguna no la tengas

- `pip install pandas`
- `pip install requests`
- `pip install mysql-connector-python`
- `pip install python-dotenv`

### 2. Configura la API de Last.fm

  - Obtén tu clave en Last.fm API.

  - Crea un archivo .env en la carpeta raíz.

  - Añade tu clave: API_KEY=tu_clave_aquí.

### 3. Orden de ejecución

  - obtencion_lista_artistas_spotify.ipynb

  - obtencion_info_artistas_api.ipynb

  - creacion_insercion_consultas.ipynb (Configura tu usuario/password de MySQL en el script).

## 🔮 Mejoras y Próximos Pasos

- **Consolidación y Autonomía de Datos:** El siguiente paso técnico es generar un archivo maestro en formato .json que unifique los datos ya procesados. Esto permitirá eliminar la dependencia de APIs externas en futuras ejecuciones, optimizar la velocidad de carga en MySQL y asegurar que la información esté totalmente validada antes de la inserción definitiva.

## 👥 Equipo de Desarrollo

- **Natalia Pozo** - Scrum Master

- **Katya Huachaca** - Data Engineer

- **Iciar Castellano** - Data Engineer

- **Pilar Quevedo** - Business Intelligence Analyst

- **Saray H. Fleitas** - Business Intelligence Analyst
