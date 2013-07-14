module Docuvator
  class WordAnalyzer
    attr_accessor :paragraphs, :sentences, :word_frequency, :total_words, :total_characters, :average_characters_per_word

    def initialize(paragraphs, sentences, word_frequency)
      @paragraphs = paragraphs
      @sentences = sentences
      @word_frequency = word_frequency
      @total_words = 0
      @total_characters = 0
      @average_characters_per_word = 0
    end

    def analyze
      @word_frequency.each_pair do |k,v|
        @total_characters += k.size * v
        @total_words += v
      end

      @average_characters_per_word = @total_characters.to_f/@total_words.to_f
    end

    def results
      Log.info
      Log.info "::Word Analyzer::"
      Log.info "Unique words: #{@word_frequency.size}"
      Log.info "Total words: #{@total_words}"
      Log.info "Total characters (excluding spaces): #{@total_characters}"
      Log.info "Average characters per word: #{@average_characters_per_word}"
    end
  end
end
