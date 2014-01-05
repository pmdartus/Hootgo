Hootgo
======

Social post traduction API

Installation
------------

### Requirements

* [Git](http://git-scm.com/)
* [Ruby](http://www.ruby-lang.org/fr/)
* [Rails](http://rubyonrails.org/)
* [Bundler](http://gembundler.com/)
* [Foreman](http://ddollar.github.io/foreman/)
* [sqLite3](http://www.sqlite.org/)

### Get the sources

```shell
git clone git@github.com:pmdartus/Hootgo.git
cd Hootgo
```

### Bundle it

It install all the packages dependences, form rubygems.org

```shell
bundle install
```

Boostrap the application
------------------------

Setup the database for development

```shell
rake db:create				// Create the databases
rake db:migrate				// Execute all the migration on the database
rake db:seed				// Insert the database preexisting objects
```

To be able to launch the server you will have to create a `.env` file in the root directory

```shell
RACK_ENV=development
PORT=3000
SECRET_TOKEN=[A random secret token]
FB_APP_ID=[Facebook application ID]
FB_APP_SECRET=[Facebook application secret]
TW_APP_ID=[Twitter application ID]
TW_APP_SECRET=[Twitter application secret]
```

You are now ready to launch the dev server

```shell
gem install foreman         // Install the foreman gem to launch the unicorn server
foreman start				// Launch server in development mode
rake						// Test all the applications
```