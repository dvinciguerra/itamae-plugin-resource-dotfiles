# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('./lib', __dir__))

require_relative "lib/itamae/plugin/resource/dotfiles/version"

Gem::Specification.new do |spec|
  spec.name = "itamae-plugin-resource-dotfiles"
  spec.version = Itamae::Plugin::Resource::Dotfiles::VERSION
  spec.authors = ["Daniel Vinciguerra"]
  spec.email = ["daniel.vinciguerra@bivee.com.br"]

  spec.summary = "itamae-plugin-resource-dotfiles is a Itamae plugin to manage dotfiles"
  spec.description = "italia-plugin-resource-dotfiles is a Itamae plugin to manage dotfiles"
  spec.homepage = "https://github.com/dvinciguerra/itamae-plugin-resource-dotfiles"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_dependency "itamae"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
