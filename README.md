# actionview-component-demo

Rails application with ActionView::Component

## Monkey Patch

The monkey patch necessary to use this code on versions of Rails prior to the alpha of 6.1 can be found in `app/lib/action_view/component.rb`.

## Ruby version

Use your favorite Ruby version manager to install `2.6.1`.

## Local development

Install Postgres as desired.

## Configuration

`bundle install`
`npm install`

## Database creation

`rails db:setup`

## How to run the test suite

`rspec`

## Server

`rails s`

## Benchmark

Run server in production mode: `RAILS_ENV=production rails s`.

Load `/benchmark` and read server log.
