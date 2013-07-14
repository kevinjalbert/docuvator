require 'docuvator/initialize'

module Docuvator
  class CLI
    attr_reader :options
    def initialize
      @options = OpenStruct.new(
        verbose: false,
        debug: false,
      )
      parse_options
      determine_log_level
    end

    def process(file)
      Log.info "Processing #{file}"
      Splitter.new(file).split
    end

    def parse_options
      OptionParser.new do |opt|
        opt.version = VERSION
        opt.on "-d", "--debug", "Debug output (shows DEBUG level log statements)" do
          options.debug = true
        end
      end.parse!
    end

    private

    def determine_log_level
      if options.debug
        Log.level = Logger::DEBUG
        Log.use_debug
      else
        Log.level = Logger::INFO
      end
    end

  end
end
