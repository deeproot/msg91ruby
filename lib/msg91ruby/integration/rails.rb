module Msg91ruby
  module Integration
    module Rails
      if defined?(::Rails::Railtie)
        class Railtie < ::Rails::Railtie
          # Load rake tasks (eg. Heroku)
          rake_tasks do
            Dir[File.join(File.dirname(__FILE__),'../tasks/*.rake')].each { |f| load f }
          end

          ActiveSupport.on_load :before_configuration, :yield => true do
            # Manually load the custom initializer before everything else
            initializer = ::Rails.root.join("config", "initializers", "msg91ruby.rb")
            require initializer if File.exist?(initializer)

            # Parse the settings before any of the initializers
            Msg91ruby.load_and_set_settings(
              ::Rails.root.join("config", "sms_settings.yml").to_s
            )
          end
        end
      end
    end
  end
end