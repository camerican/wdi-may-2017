# Sinatra w/ Active Record From Scratch

### Prerequisites

- [ ] First, make sure we have ruby.  Type `ruby -v` to make certain.  

Next, we're going to want to make sure we have homebrew (many of us should already have it).  To test, we can type `brew -v` in the terminal.

- [ ] If you find that brew is not installed, you can type the following found at [brew.sh](http://brew.sh):

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- [ ] Make sure that sqlite3 is installed.  You can type `sqlite3 -version` to check.  If it's not there, you can type

```bash
brew install sqlite3
```

- [ ] Make sure we have the bundler gem installed.  Type `bundler -v` to check.  If you don't have it, you can install via gem install: `gem install bundler`

### Getting started with our project

- [ ] Create a new project directory `mkdir our_project`
- [ ] Move into that directory `cd our_project`
- [ ] Create necessary directories with `mkdir` and touch out necessary files with `touch`

For this project, we created the project folder `sinatra-from-scratch` with a `README.md` file (this file).

- [ ] Touch out a Gemfile and a Rakefile

### Gemfile

```
source 'http://rubygems.org'

gem 'sinatra'
gem 'sinatra-activerecord'
gem 'sqlite3'
gem 'rake'
```

We use Sinatra to host our web application through.  We use the Sinatra version of activerecord to serve as the go-between to our database that our Models inherit from.  And we're using sqlite3 as our database for now.  Later, if we publish our application to Heroku, we're going to need to switch to another database like postgres.

### Rakefile

```
require 'sinatra/activerecord/rake'
require './server'
```

We're requiring the rake library and then our own main application (called 'server').

### server.rb (or app.rb or main.rb)

Now for our main application file.  

- [ ] Let's touch out our main file: `touch server.rb`.

## Note: we're going to theme this project after "Hacking"

```ruby
# server.rb
require 'sinatra'
require 'sinatra/activerecord'
# configure our database
set :database, {adapter: "sqlite3", database: "db/hack.db"}
# models.rb requires a database connection, so let's include that only after the database is configured
require './models'

get '/' do
  'Hello, my hacker nemesis.  Prepare to be hacked. Mwahaha.'
end
```

To stop complaints about models.rb not existing, let's touch the models.rb file: `touch models.rb`.

## Prepare to Rake

- [ ] Let's make sure our gems are ready for use.  `bundle install` to set up the gems for use.

## Migrations

We're going to use rake (Ruby make, our task runner) to create and manage our migrations and database related activities.

Let's create our first migration.

- [ ] `rake db:create_migration NAME=initialize_database`

This will create a file `db/migrate/[timestamp]_initialize_database.rb`.

`eg: 20170629183413_initialize_database.rb`

## Note: If we have an issue with running rake commands, try using it with `bundle exec`.  Eg: `bundle exec rake db:create_migration NAME=initialize_database`

ref: [why bundle exec](https://stackoverflow.com/questions/6588674/what-does-bundle-exec-rake-mean)
ref: [create an alias for bundle exec, if you're lazy](https://robots.thoughtbot.com/but-i-dont-want-to-bundle-exec)

### Populate initial migration

- [ ] We'll create our initial database tables:

```ruby
class InitializeDatabase < ActiveRecord::Migration[5.0]
  def change
    # users table
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.timestamps
    end
    # posts table
    create_table :posts do |t|
      # t.integer :user_id
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
```

- [ ] And now we'll run our migration: `bundle exec rake db:migrate`




