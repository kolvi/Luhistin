# Luhistin
Luhistin

There's nothing here yet, but reading is healthy, says the doctor...


To start:

brew install postgresql

(then install the first database)

createdb

(then go to psql)
(https://orahow.com/postgresql-create-database/)

psql
CREATE DATABASE luhistin;
CREATE USER luhistin PASSWORD 'kaik_on_menny';
GRANT ALL PRIVILEGES ON DATABASE luhistin TO luhistin;

(You may want to turn on password "control" for psql database:
https://www.mariadcampbell.com/blog/changing-your-homebrew-postgresql-configuration-from-trust-to-md5/
)