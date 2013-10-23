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

### Bootstrap your database

Setup the database for development

```shell
rake db:create				// Create the databases
rake db:migrate				// Execute all the migration on the database
rake db:seed				// Insert the database preexisting objects
```
### Prepare the future

```shell
rails server				// Launch server in development mode
rake						// Test all the applications
```