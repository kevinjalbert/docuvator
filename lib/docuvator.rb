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
      splitter = Splitter.new(file)
      data = splitter.split

      paragraph_analyzer = ParagraphAnalyzer.new(data)
      paragraph_analyzer.analyze
      paragraph_analyzer.results

      sentence_analyzer = SentenceAnalyzer.new(data)
      sentence_analyzer.analyze
      sentence_analyzer.results

      word_analyzer = WordAnalyzer.new(data)
      word_analyzer.analyze
      word_analyzer.results
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
