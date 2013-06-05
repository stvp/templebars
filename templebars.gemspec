# -*- encoding: utf-8 -*-
require File.expand_path('../lib/templebars/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "templebars"
  s.version     = Templebars::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tyson Tate"]
  s.email       = ["tyson@stovepipestudios.com"]
  s.homepage    = "http://rubygems.org/gems/templebars"
  s.summary     = "Use precompiled Handlebars templates with Rails 3"
  s.description = "This gem provides Handlebars magic for your Rails 3 application."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "templebars"

  s.add_dependency "sprockets", ">= 2.0.0"
  s.add_dependency "execjs", "~> 1.4.0"
  s.add_dependency "tilt", "~> 1.3"
  s.add_development_dependency "rake"

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
end
