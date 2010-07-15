# -*- encoding: utf-8 -*-
require 'rubygems' unless Object.const_defined?(:Gem)
require File.dirname(__FILE__) + "/lib/bacon/bits"
 
Gem::Specification.new do |s|
  s.name        = "bacon-bits"
  s.version     = Bacon::Bits::VERSION
  s.authors     = ["Gabriel Horner"]
  s.email       = "gabriel.horner@gmail.com"
  s.homepage    = "http://github.com/cldwalker/bacon-bits"
  s.summary = "Making bacon a little tastier."
  s.description =  "This extends the bacon testing framework with useful extensions to disable tests, have before and after blocks that run once and more."
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = 'tagaholic'
  s.files = Dir.glob(%w[{lib,test}/**/*.rb bin/* [A-Z]*.{txt,rdoc} ext/**/*.{rb,c}]) + %w{Rakefile .gemspec}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE.txt"]
  s.add_dependency 'bacon', '>=1.1.0'
  s.license = 'MIT'
end
