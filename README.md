[![Build Status](https://travis-ci.org/Shkrt/trainer_plugin.svg?branch=engine)](https://travis-ci.org/Shkrt/trainer_plugin)

## Installation

- Put this in your Gemfile

`gem "trainer_plugin", git: "https://github.com/Shkrt/trainer_plugin.git", branch: "engine"`

and then run

`bundle install`

- Run generators

`rails g settings trainer_plugin User`

where last parameter "User" should match your exact user class, e.g Profile or some other. The corresponding database table of your user class also should have fields :id and :email

- Run migrations

`rake db:migrate`

- In your ApplicationController:

`include TrainerPlugin`

- In newly generated `config/initializers/trainer_plugin.rb`, customize string representation of your `User/Profile/Account` etc. model

```ruby
TrainerPlugin.configure do |config|
  config.user_class = "User"
  #config.user_class = "Profile"
  #config.user_class = "Account"
end
```

- In app's application.rb file set up background processing adapters (redis-rails is shipped with the gem)

If these variables are not set, jobs will be processed immediately.

```ruby
config.active_job.queue_adapter = :sidekiq
config.cache_store = :redis_store, "redis://localhost:6379/0/cache"
```
- In application.js:

```javascript
//= require ahoy
ahoy.trackView()
```

## Usage

Call `track` method from any of your controller actions, passing it some message and user id:

```ruby
def index
  track("index action has been invoked", current_user.id)
end
```

Sidekiq worker must be launched for action tracking to work!

Open the main page of engine at the mount point (e.g. `127.0.0.1:3000/stats/`), and choose type of report and parameters, if applicable. The report graph will be generated on the same page.
