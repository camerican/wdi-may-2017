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
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
```

- [ ] And now we'll run our migration: `bundle exec rake db:migrate`

### Instruct our Models to Inherit form Active Record

- [ ] add a User class
- [ ] add a Post class

```ruby
class User < ActiveRecord::Base

end
class Post < ActiveRecord::Base

end
```

Let's now define the relationships between our models/tables:

```ruby
class User < ActiveRecord::Base
  has_many :posts
end
class Post < ActiveRecord::Base
  belongs_to :user
end
```


### Create Initial Data to work with

We'll create a seeds.rb file to get our system up and running with some data.  This is a good idea for any system to have, so we can have data for testing/presenting with and easily go back to a blank slate without having a totally empty databse.

- [ ] `touch db/seeds.rb`

```ruby
# seeds.rb
# Create our users
User.create([
  {id: 1, first_name: 'Hans', last_name: 'Palacios', email: 'hans@mrperfect.com', password: 'duckduckgoose'},
  {id: 2, first_name: 'James', last_name: 'Lim', email: 'james@bond.com', password: 'shakennotstirred'},
  {id: 3, first_name: 'Neil', last_name: 'Parsa', email: 'neil@parsa.net', password: 'neilneil'},
  {id: 4, first_name: 'Logan', last_name: 'Baker', email: 'logan@animalhospital.org', password: 'password'},
  {id: 5, first_name: 'David', last_name: 'Zheng', email: 'dennis@itsalwayssunny.com', password: '134><DFNAL!#$3'},
  {id: 6, first_name: 'Victor', last_name: 'Ganda', email: 'Victor@liverpoolfc.com', password: 'manusucks'},
  {id: 7, first_name: 'Erin', last_name: 'Young', email: 'erin@young.com', password: 'westvirginiaisthebestvirginia'},
  {id: 8, first_name: 'Steven', last_name: 'Velez-Garcia', email: 'steven@steven.com', password: '#!$kldfalk2343'},
  {id: 9, first_name: 'Katy', last_name: 'Pola', email: 'katy@pola.com', password: 'paperpaper'},
  {id: 10, first_name: 'Julia', last_name: 'Kopyeva', email: 'julia@k.ru', password: 'designsbyjulia'},
  {id: 11, first_name: 'Nick', last_name: 'Fehlinger', email: 'nick@lodeon.com', password: 'supersecret'}
])
# posts
Post.create([
  {user_id: 4, title: 'Ducks are great', body: 'Ducks are the best pets to operate on.  They love bread, so they always have money to pay on time.'},
  {user_id: 11, title: 'Johnny Nmemonic is the Greatest Movie of our time', body: 'Johnny Nmemonic needs his room service.  This tour de fource from Keanu Reeves forever transformed the genre of futuristic action thrillers.  The dolphin hacker single-finnedly convinced me to devote my energy towards attaining its level of sonar coding dominance.  One day I will also fry Dolph Lundgren with the power of my coding abilities.'},
  {user_id: 11, title: 'What is all this?', body: 'This is madness, madness I tell you!'}
])
```


### Create routes for our site

- [ ] We'll create a home page route and a profile page route, and then touch out the erb files.

```ruby
get '/' do
  @users = User.all
  erb :home
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :profile
end
```

And create our views.  `mkdir views` and then `touch views/home.erb views/profile.erb`.


## Rake commands

| Command | Description | Example |
| ---- | ---- | ---- |
| db:create_migration | Creates a migration file | rake db:create_migration NAME=initialize_database |
| db:migrate | Runs all pending migrations | rake db:migrate |
| db:rollback | Reverse one migration | rake db:rollback |
| db:drop | Remove database entirely | rake db:drop |
| db:reset | drop data and re-migrate + reseed | rake db:reset |
| db:seed | Run a seeds.rb file to generate initial data | rake db:seed |

## File inventory

| File | description |
| ---  | ------ |
| server.rb | Main application file |
| models.rb | Defines activerecord models so we can access database tables efficiently |
| views/* | holds our erb templates to display HTML + embedded ruby |
| db/migrate/* | holds migration files that modify the databse schema |
| db/seeds.rb | Creates our initial data rows using our active record models defined in models.rb |
| db/schema.rb | Created by rake db:migrate - the current state of our database |
| Gemfile | Defines library files that we can install with bundler |
| Rakefile | Requires necessary files for our rake task runner to work |

