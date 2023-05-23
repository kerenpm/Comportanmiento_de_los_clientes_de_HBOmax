
-- Tabla de cuentas
CREATE TABLE accounts (
    id SERIAL NOT NULL,
    customer_id SERIAL NOT NULL,
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
CREATE TABLE sessions (
    id SERIAL NOT NULL,
    account_id INT NOT NULL,
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
    id SERIAL NOT NULL,
    account_id serial NOT NULL,
    date_subscription DATE NOT NULL,
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
    id SERIAL NOT NULL,
    subscription_id SERIAL NOT NULL,
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
    id SERIAL NOT NULL ,
    profile_id SERIAL NOT NULL,
    serie_id SERIAL NOT NULL,
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
    id SERIAL NOT NULL,
    serie_id SERIAL NOT NULL,
    category_id INT NOT NULL,
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
CREATE TABLE languages_series (
    id SERIAL NOT NULL,
    language_id SERIAL NOT NULL,
    serie_id SERIAL NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT languages_series_language_id_fkey FOREIGN KEY(language_id)
     REFERENCES languages(id),
    CONSTRAINT languages_series_serie_id_foreign FOREIGN KEY(serie_id)
     REFERENCES series(id)
    ON UPDATE CASCADE
)
;

-- Tabla de perfiles y peliculas
CREATE TABLE profiles_movies (
    id SERIAL NOT NULL,
    profile_id SERIAL NOT NULL,
    movie_id SERIAL NOT NULL,
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
CREATE TABLE languages_movies (
    id SERIAL NOT NULL,
    language_id SERIAL NOT NULL,
    movie_id SERIAL NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT languages_movies_language_id_fkey FOREIGN KEY(language_id)
     REFERENCES languages(id),
    CONSTRAINT languages_movies_movie_id_fkey FOREIGN KEY(movie_id)
     REFERENCES movies(id)
    ON UPDATE CASCADE
)
;

-- Tabla de peliculas y categorias
CREATE TABLE movies_categories (
    id SERIAL NOT NULL,
    movie_id SERIAL NOT NULL,
    category_id SERIAL NOT NULL,
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