# Parsi

This simple Hanami application has one endpoint receiving only parameter.

Receiving "urls" array parameter it fetches pages titles in parallel using Ruby Threads and persists in in database.

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
