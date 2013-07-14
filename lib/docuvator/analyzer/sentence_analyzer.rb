module Docuvator
  class SentenceAnalyzer
    attr_accessor :paragraphs, :sentences, :word_frequency

    def initialize(paragraphs, sentences, word_frequency)
      @paragraphs = paragraphs
      @sentences = sentences
      @word_frequency = word_frequency
    end

    def analyze

    end

    def results
      Log.info
      Log.info "::Sentence Analyzer::"
      Log.info "Number of sentences: #{@sentences.size}"
    end
  end
end
