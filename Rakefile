#!/usr/bin/env rake

require 'rake/clean'
require 'rspec/core/rake_task'
require 'bundler/gem_tasks'
require 'tailor/rake_task'

CLOBBER.include('coverage')

Tailor::RakeTask.new

desc "Run all specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*spec.rb"
end

desc "Run docuvator on specified file (for debugging)"
task :run, :file do |t, args|
  Bundler.require(:debug)
  require 'docuvator'
  Docuvator::CLI.new.process(args[:file])
end

desc "Install treat language"
task :language, :language do |t, args|
  require 'treat'
  if args[:language].nil?
    Treat::Core::Installer.install 'travis'
  else
    Treat::Core::Installer.install args[:language].to_s
  end
end

task :default => :spec
