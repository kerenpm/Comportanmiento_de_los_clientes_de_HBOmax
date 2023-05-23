-- Tabla de clientes
CREATE TABLE customers (
    id SERIAL NOT NULL,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)
;

-- Tabla de series
CREATE TABLE series (
    id SERIAL NOT NULL,
    title VARCHAR(250) NOT NULL,
    release_year DATE NOT NULL,
    creator VARCHAR(60) NOT NULL,
    duration SMALLINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)
;

-- Tabla de lenguajes
CREATE TABLE lenguages (
    id SERIAL NOT NULL,
    lenguage VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)
;

-- Tabla de categorías
CREATE TABLE categories (
    id SERIAL NOT NULL,
    categorie VARCHAR(30) NOT NULL,
    classification VARCHAR(30) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)
;

-- Tabla de películas
CREATE TABLE movies (
    id SERIAL NOT NULL,
    title VARCHAR(250) NOT NULL,
    release_year INTEGER NOT NULL,
    director VARCHAR(50) NOT NULL,
    duration SMALLINT NOT NULL,
    clasification CHAR(8) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)
;
