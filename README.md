# BackSupport API

Ticketing system based on Zendesk backend


Hosted on Heroku: http://backsupport-api.herokuapp.com/

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
Ruby

Rails

### Running on local machine

First, install the dependencies of the app/set up the database by running the following commands in the root directory:

```
bundle install

rake db:migrate
```


After you have bundle installed, you can now run the rails server with this:

```
rails s
```

Then, please seed the database with the following command:

```
rake db:seed
```

Then, you have to set up [backsupport-client](https://github.com/jhcheung/backsupport-client) in order to use the api. API endpoints consist of

```
/api/v1/users

/api/v1/tickets

/api/v1/messages
```

Data is serialized using Fast JSON.
