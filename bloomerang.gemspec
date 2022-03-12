# frozen_string_literal: true

require_relative "lib/bloomerang/version"

Gem::Specification.new do |spec|
  spec.name = "bloomerang"
  spec.version = Bloomerang::VERSION
  spec.authors = ["Nikky Southerland"]
  spec.email = ["nikky@mcsweeneys.net"]

  spec.summary = "Unofficial Ruby client for Bloomerang"
  spec.description = "Unofficial Ruby client for bloomerang.co, a donor management platform"
  spec.homepage = "https://github.com/mcsweeneys/bloomerang"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mcsweeneys/bloomerang"
  spec.metadata["changelog_uri"] = "https://github.com/mcsweeneys/bloomerang/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
