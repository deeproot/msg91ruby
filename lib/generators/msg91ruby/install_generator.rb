module Msg91ruby
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      def self.source_root
        @_rails_config_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def copy_initializer
        template "msg91ruby.rb", "config/initializers/msg91ruby.rb"
      end

      def copy_settings
        template "sms_settings.yml", "config/sms_settings.yml"
      end

      def modify_gitignore
        append_to_file '.gitignore' do
          "\n"                                +
          "config/settings/*_settings.yml\n"
        end
      end
    end
  end
end