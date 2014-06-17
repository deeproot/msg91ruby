require 'active_support/core_ext/module/attribute_accessors'
require "msg91ruby/version"
require "msg91ruby/options"
require "msg91ruby/sources/yaml_source"
require "msg91ruby/api"
require "net/http"
require "net/https"
require "uri"


module Msg91ruby
  # ensures the setup only gets run once
  @@_ran_once = false

  mattr_accessor :const_name, :use_env
  @@const_name = "SmsSettings"
  @@use_env = false

  def self.setup
    yield self if @@_ran_once == false
    @@_ran_once = true
  end

 # Create a populated Options instance from a yaml file.  If a second yaml file is given, then the sections of that file will overwrite the sections
  # if the first file if they exist in the first file.
  def self.load_files(*files)
    config = Options.new

    # add yaml sources
    [files].flatten.compact.uniq.each do |file|
      config.add_source!(file.to_s)
    end

    config.load!
    config.load_env! if @@use_env
    config
  end

  # Loads and sets the settings constant!
  def self.load_and_set_settings(*files)
    Kernel.send(:remove_const, Msg91ruby.const_name) if Kernel.const_defined?(Msg91ruby.const_name)
    Kernel.const_set(Msg91ruby.const_name, Msg91ruby.load_files(files))
  end

  def self.reload!
    Kernel.const_get(Msg91ruby.const_name).reload!
  end
end

require('msg91ruby/integration/rails') if defined?(::Rails)
