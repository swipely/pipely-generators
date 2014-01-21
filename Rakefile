#!/usr/bin/env rake

require "bundler/gem_tasks"

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

require 'cane/rake_task'

Cane::RakeTask.new(:quality) do |cane|
  cane.canefile = '.cane'
end

task :default => [:quality]
