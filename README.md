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
    api.send(mobileno, message)

eg: 

    require 'msg91ruby'
    api = Msg91ruby::API.new("2552515255255255252","113388")
    api.send(1234567890, "Test Message")
    api.send([1234567890,9012345678], "Test Message")

## SMS Settings

You can generate a Yaml file to store the Sms Settings required for your application with following command

    rails g msg91ruby:install


## Contributing

1. Fork it ( https://github.com/deeproot/msg91ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
