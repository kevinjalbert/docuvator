module Docuvator
  class WordAnalyzer < Analyzer
    attr_reader :data
    attr_accessor :total_words, :total_characters, :average_characters_per_word

    def initialize(data)
      @data = data
      @word_frequency = Hash.new(0)
      @total_characters = 0
      @average_characters_per_word = 0
    end

    def analyze
      @data.words.each do |word|
        @word_frequency[word.to_s] = @word_frequency[word.to_s] + 1
        @total_characters += word.to_s.size
      end

      @average_characters_per_word = @total_characters.to_f/@data.words.size.to_f
    end

    def results
      Log.info "Unique words: #{@word_frequency.size}"
      Log.info "Total words: #{@data.words.size}"
      Log.info "Total characters (excluding spaces): #{@total_characters}"
      Log.info "Average characters per word: #{@average_characters_per_word}"
    end
  end
end
