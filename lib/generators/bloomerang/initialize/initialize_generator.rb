# frozen_string_literal: true

require "rails/generators/base"

module Bloomerang
  module Generators
    class InitializeGenerator < Rails::Generators::Base
      desc "Copy Bloomerang initializer file"
      def create_initializer_file
        copy_file "../templates/bloomerang_config.rb", "config/initializers/bloomerang.rb"
      end
    end
  end
end
