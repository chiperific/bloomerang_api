# frozen_string_literal: true

require "rails/generators/base"

module Bloomerang
  module Generators
    class InitializerGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Copy Bloomerang initializer file"
      def create_initializer_file
        copy_file "../templates/bloomerang_config.rb", "config/initializers/bloomerang.rb"
      end
    end
  end
end
