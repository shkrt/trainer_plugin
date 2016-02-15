[![Build Status](https://travis-ci.org/Shkrt/trainer_plugin.svg?branch=engine)](https://travis-ci.org/Shkrt/trainer_plugin)
[![Code Climate](https://codeclimate.com/github/Shkrt/trainer_plugin/badges/gpa.svg)](https://codeclimate.com/github/Shkrt/trainer_plugin)
[![Test Coverage](https://codeclimate.com/github/Shkrt/trainer_plugin/badges/coverage.svg)](https://codeclimate.com/github/Shkrt/trainer_plugin/coverage)

## Installation

- Put this in your Gemfile

`gem "trainer_plugin", git: "https://github.com/Shkrt/trainer_plugin.git", branch: "engine"`

and then run

`bundle install`

- Run generators

`rails g settings trainer_plugin User`

where last parameter "User" should match your exact user class, e.g Profile or some other. The corresponding database table of your user class also should have fields :id and :email. Current user method should be named "current_user".

- Run migrations

`rake db:migrate`

- In newly generated `config/initializers/trainer_plugin.rb`, enter string representation of your `User/Profile/Account` etc. model. You should enter exactly the same string that you passed as last argument to generator.

```ruby
TrainerPlugin.configure do |config|
  config.user_class = "User"
  #config.user_class = "Profile"
  #config.user_class = "Account"
end
```

- Generators should have added these options to config/application.rb:

```ruby
config.active_job.queue_adapter = :sidekiq
config.cache_store = :redis_store, "redis://localhost:6379/0/cache"
```

Customize this according to your setup. Redis-rails is shipped with the gem. If these variables are not set, jobs will be processed immediately.
## Usage

Call `track` method from any of your controller actions, passing it some message and user id:

```ruby
def index
  track("index action has been invoked", current_user.id)
end
```

Sidekiq worker must be launched for action tracking to work!

Page views(not clicks!) would be tracked by default.

Open the main page of engine at the mount point (e.g. `127.0.0.1:3000/stats/`), and choose type of report and parameters, if applicable. The report graph will be generated on the same page.

![alt text](https://github.com/Shkrt/trainer_plugin/raw/master/stats.png "Output example")
