module Docuvator
  class SentenceAnalyzer < Analyzer
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def analyze

    end

    def results
      Log.info "Number of sentences: #{@data.sentences.size}"
    end
  end
end
