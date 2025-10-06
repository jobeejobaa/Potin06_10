# PotinMaster

Welcome to PotinMaster! This is a simple Ruby on Rails application designed to manage gossip posts. 

## Ruby Version
This application is built on Ruby version 3.4.2

## System Dependencies
- Rails 8.0.3
- SQLite3
- gem 'faker' (to generate random words to seed the databases)
- Node.js and Yarn (for managing JavaScript dependencies)

## Configuration
Ensure you have the correct Ruby version installed. You can manage Ruby versions using a version manager like rbenv or RVM.

To set up the application, clone this repository using:
```shell
git clone https://github.com/Sylphux/PotinMaster
```

Install the necessary gems:
```bash
bundle install
```

## Database Initialization
After creating the database, you will need to run the migrations and seeds:
```bash
rails db:migrate
rails db:seed
```

## Starting the server
When the databases are filled, start the server with the command :
```shell
rails server
```
The ip and port will be displayed on your terminal. You can open the app from there.

## Conclusion
This application is an ongoing project that will progressively incorporate more features such as user management, comment functionality, and enhanced user interface components.

## Credits
This project is done within "The Hacking Project" fullstack cursus