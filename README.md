# Introduction: PokeFight

Class Project for CSCE 608, Database System Fall 2017.

Github Repository located at: https://github.com/caffrey26/db_project_1

The aim of the project was to create large volume of data using a relational DBMS, and write SQL programs to populate, manipulate, and query the database.

This project builds a real database system to provide a mechanism to store pokemon-based fights between players.
It allows to create multiple players, pokemons, and then assign multiple pokemons to different players.
It also allows to record fights between players, and their pokemons. It then dynamically creates ranking chart based on the number of fights won by the player.

## Authors             

Rahul Saini (rssaini @ tamu . edu)


## Getting started

You can directly use the web application deployed on heroku here: https://aqueous-thicket-33890.herokuapp.com/
Or: 
To get started with the app, clone the repo and then install the needed gems:

$ bundle install --without production

Next, migrate the database:

$ rails db:migrate

Finally, run the test suite to verify that everything is working correctly:

$ rails test

If the test suite passes, you'll be ready to run the app in a local server:

$ rails server