require 'pathname'
require 'ostruct'
require 'optparse'

Dir.glob(File.dirname(__FILE__) + '/**/*.rb') { |file| require file }
