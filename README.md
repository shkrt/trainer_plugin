[![Build Status](https://travis-ci.org/Shkrt/trainer_plugin.svg?branch=engine)](https://travis-ci.org/Shkrt/trainer_plugin)

## Installation

- Put this in your Gemfile

`gem "trainer_plugin", git: "https://github.com/Shkrt/trainer_plugin.git", branch: "engine"`
and then run `bundle install`
- Generate ahoy stores

`rails generate ahoy:stores:active_record -d postgresql`

` rake db:migrate`

- Mount engine:

`mount TrainerPlugin::Engine => "/stats"`

- Bind your User model like this:

`has_many :ahoy_events, class_name: "Ahoy::Event"`

- In your ApplicationController:

`include TrainerPlugin`

- In config/initializers/trainer_plugin.rb, define string representation of your User/Profile/Account model

```ruby
TrainerPlugin.configure do |config|
  config.user_class = "User"
end
```

- In app's application.rb file set up background processing adapters (redis-rails is distributed with the gem)

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
