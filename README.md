[![Build Status](https://travis-ci.org/Shkrt/trainer_plugin.svg?branch=engine)](https://travis-ci.org/Shkrt/trainer_plugin)

## Installation

- Put this in your Gemfile

`gem "trainer_plugin", git: "https://github.com/Shkrt/trainer_plugin.git", branch: "engine", ref: "a0b98c2"`
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


## Usage

Call `track` method from any of your controller actions, passing it some message and user id:

```ruby
def index
  track("index action has been invoked", current_user.id)
end
```

Logging of all page views processed by default.

Sidekiq worker must be launched for tracking to work!

Open the main page of engine at the mount point (e.g. `127.0.0.1:3000/stats`), and choose type of report and parameters, if applicable. The report graph will be generated on the same page.
