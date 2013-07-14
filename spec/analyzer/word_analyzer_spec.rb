require 'spec_helper'

include Docuvator

describe WordAnalyzer do
  let(:splitter) {
    splitter = Splitter.new(file)
    splitter.split
    splitter
  }

  let(:word_analyzer) { WordAnalyzer.new(splitter.paragraphs, splitter.sentences, splitter.word_frequency) }

  context "initializes instance" do
    context "with valid data" do
      let(:file) { fixture('lorem_ipsum.txt') }

      it { word_analyzer.paragraphs.size.should eq 3 }
      it { word_analyzer.sentences.size.should eq 39 }
      it { word_analyzer.word_frequency.size.should eq 124 }
    end
  end

  describe "#results" do
    context "valid file" do
      let(:file) { fixture('lorem_ipsum.txt') }
      let(:analyzed) {
        word_analyzer.analyze
        word_analyzer
      }

      it { analyzed.word_frequency.size.should eq 124 }
      it { analyzed.total_words.should eq 343 }
      it { analyzed.total_characters.should eq 1980 }
      it { analyzed.average_characters_per_word.should eq 5.772594752186589 }
    end
  end
end
