module Docuvator
  class ParagraphAnalyzer
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
      Log.info "::Paragraph Analyzer::"
      Log.info "Number of paragraphs: #{@paragraphs.size}"
    end
  end
end
