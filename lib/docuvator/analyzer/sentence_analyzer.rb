module Docuvator
  class SentenceAnalyzer
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def analyze

    end

    def results
      Log.info
      Log.info "::Sentence Analyzer::"
      Log.info "Number of sentences: #{@data.sentences.size}"
    end
  end
end
