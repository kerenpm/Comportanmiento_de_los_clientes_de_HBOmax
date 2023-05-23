-- Tabla de clientes
CREATE TABLE customers (
    id INT NOT NULL,
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
    id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
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
    id INT NOT NULL,
    lenguage VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)
;

-- Tabla de categorías
CREATE TABLE categories (
    id INT NOT NULL,
    categorie VARCHAR(30) NOT NULL,
    classification VARCHAR(30) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)
;

-- Tabla de películas
CREATE TABLE movies (
    id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    release_year INTEGER NOT NULL,
    director VARCHAR(50) NOT NULL,
    duration SMALLINT NOT NULL,
    clasification CHAR(8) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)
;

-- Tabla de cuentas
CREATE TABLE accounts (
    id INT NOT NULL,
    customer_id INT UNSIGNED NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    registration_date TIMESTAMP NOT NULL,
    password VARCHAR(25) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT customer_id_foreign FOREIGN KEY(customer_id)
    REFERENCES customers(id)
)
;

-- Tabla de sesiones 
CREATE TABLE `sessions` (
    id INT NOT NULL,
    account_id INT UNSIGNED NOT NULL,
    device VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT account_id_fkey FOREIGN KEY(account_id)
      REFERENCES accounts(id)
)
;

-- Tabla de suscripciones 
CREATE TABLE subscriptions (
    id INT NOT NULL,
    account_id INT UNSIGNED NOT NULL,
    date_billing DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    current_plan VARCHAR(50) NOT NULL,
    price DECIMAL(5,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT account_id_foreign FOREIGN KEY(account_id)
      REFERENCES accounts(id)
)
;

-- Tabla de perfiles
CREATE TABLE profiles (
    id INT NOT NULL,
    subscription_id INT UNSIGNED NOT NULL,
    name VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    catgory VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT subscription_id_foreign FOREIGN KEY(subscription_id)
    REFERENCES subscriptions(id)
    ON UPDATE CASCADE
)
;

-- Tabla de perfil y serie
CREATE TABLE profiles_series (
    id INT NOT NULL ,
    profile_id INT UNSIGNED NOT NULL,
    serie_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT profile_id_fkey FOREIGN KEY(profile_id)
    REFERENCES profiles(id),
    CONSTRAINT serie_id_fkey FOREIGN KEY(serie_id)
    REFERENCES series(id)
    ON UPDATE CASCADE
)
;

-- Tabla de series y categorias
CREATE TABLE series_categories (
    id INT NOT NULL,
    serie_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT serie_id_foreingn FOREIGN KEY(serie_id)
     REFERENCES series(id),
    CONSTRAINT category_id_foreign FOREIGN KEY(category_id)
     REFERENCES categories(id)
    ON UPDATE CASCADE
)
;

-- Tabla de lenguajes y series
CREATE TABLE lenguages_series (
    id INT NOT NULL,
    lenguage_id INT UNSIGNED NOT NULL,
    serie_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT lenguages_series_lenguage_id_fkey FOREIGN KEY(lenguage_id)
     REFERENCES lenguages(id),
    CONSTRAINT lenguages_series_serie_id_foreign FOREIGN KEY(serie_id)
     REFERENCES series(id)
    ON UPDATE CASCADE
)
;

-- Tabla de perfiles y peliculas
CREATE TABLE profiles_movies (
    id INT NOT NULL,
    profile_id INT UNSIGNED NOT NULL,
    movie_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT profile_id_foreign FOREIGN KEY(profile_id)
     REFERENCES profiles(id),
    CONSTRAINT movie_id_foreign FOREIGN KEY(movie_id)
     REFERENCES movies(id)
    ON UPDATE CASCADE
)
;

-- Tabla de lenguajes y peliculas
CREATE TABLE lenguages_movies (
    id INT NOT NULL,
    lenguage_id INT UNSIGNED NOT NULL,
    movie_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT lenguages_movies_lenguage_id_fkey FOREIGN KEY(lenguage_id)
     REFERENCES lenguages(id),
    CONSTRAINT lenguages_movies_movie_id_fkey FOREIGN KEY(movie_id)
     REFERENCES movies(id)
    ON UPDATE CASCADE
)
;

-- Tabla de peliculas y categorias
CREATE TABLE movies_categories (
    id INT NOT NULL,
    movie_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT movie_id_fke FOREIGN KEY(movie_id)
     REFERENCES movies(id),
    CONSTRAINT category_id_fkey FOREIGN KEY(category_id)
     REFERENCES categories(id)
    ON UPDATE CASCADE
)
;