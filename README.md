# README

## Initial configuration

Run `bundle install` to install dependencies

In the root directory make a `.env` file and use the variables 
described in the `.env_default` file

Run `docker compose up -d` to start the database container (this assumes that
you hace docker installed)

You can get the postgres host with `docker ps` and using the container id
to inspect the container: `docker inspect CONTAINER_ID`  
Add the postgres host id to the .env file

Finally run `rails s` to start the server

## Set up database

```
rails db:create
rails db:migrate
```

## TODO

- Add name to log in / sign in
- Replace bootstrap cdn with gem
- Fix [devise issue](https://github.com/heartcombo/devise/issues/5439), check if error persists