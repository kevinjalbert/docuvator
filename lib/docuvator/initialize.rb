require 'pathname'
require 'ostruct'
require 'optparse'
require 'treat'

include Treat::Core::DSL

Dir.glob(File.dirname(__FILE__) + '/**/*.rb') { |file| require file }
