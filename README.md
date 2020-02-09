# Parsi

# [LIVE DEMO](https://parsi.herokuapp.com/?urls[]=https://www.google.com/&urls[]=https://yandex.ru/&urls[]=https://wrongwrongwrong.com/)

This simple Hanami application has one endpoint receiving array of URLs as a parameter.

It fetches pages titles in parallel using Ruby Threads, persists them in a database and shows status on an endpoint.

This project demonstrates:

- Usage of Hanami for creating web apps
- The way of testing Hanami apps
- Working with Ruby threads
- Ruby threads exception handling
- Creating records in bulk in Hanami

## Setup

Clone this repo and do `bundle install`.

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% bundle exec hanami db prepare

% HANAMI_ENV=test bundle exec hanami db prepare
```

How to run the development server:

```
% bundle exec hanami server
```

How to run tests:

```
% bundle exec rspec
```

## Usage

Run server, open your favorite browser and pass the links you desire to fetch:

http://localhost:2300/?urls[]=https://google.com&urls[]=https://yandex.ru
