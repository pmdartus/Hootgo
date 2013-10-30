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

Boostrap the application
------------------------

Setup the database for development

```shell
rake db:create				// Create the databases
rake db:migrate				// Execute all the migration on the database
rake db:seed				// Insert the database preexisting objects
```

To connect with social network you have to export all the public keys and privates keys

```shell
export FB_APP_ID="[facebook public key]"
export FB_APP_SECRET="[facebook secret key]"
```

You are now ready to launch the dev server

```shell
rails server				// Launch server in development mode
rake						// Test all the applications
```