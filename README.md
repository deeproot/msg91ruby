# Msg91ruby

A Ruby Gem to communicate with Msg91 Api to send Messages

## Installation

Add this line to your application's Gemfile:

    gem 'msg91ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install msg91ruby

## Usage

## To connect to Msg91 Api

    require 'msg91ruby'
    api = Msg91ruby::API.new(auth_key,senderid)
    api.send(mobileno, message, route)

eg: 

    require 'msg91ruby'
    api = Msg91ruby::API.new("2552515255255255252","113388")
    api.send(1234567890, "Test Message", 1)
    api.send([1234567890,9012345678], "Test Message", 1)

you can find your Auth-key here:  http://help.msg91.com/article/177-where-can-i-find-my-authentication-key

## SMS Settings

You can generate a Yaml file to store the Sms Settings required for your application with following command

    rails g msg91ruby:install

## MSG91 Account Details

You can create your account on MSG91 by simply singing up here:  https://msg91.com/signup/msg91ruby

If you are an startup company, you can avail sms credits for your Startup app. For more details visit: https://msg91.com/startups/


## Contributing

1. Fork it ( https://github.com/deeproot/msg91ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
