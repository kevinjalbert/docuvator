require 'spec_helper'

include Docuvator

describe SentenceAnalyzer do
  let(:splitter) {
    splitter = Splitter.new(file)
    splitter.split
    splitter
  }

  let(:sentence_analyzer) { SentenceAnalyzer.new(splitter.paragraphs, splitter.sentences, splitter.word_frequency) }

  context "initializes instance" do
    context "with valid data" do
      let(:file) { fixture('lorem_ipsum.txt') }

      it { sentence_analyzer.paragraphs.size.should eq 3 }
      it { sentence_analyzer.sentences.size.should eq 39 }
      it { sentence_analyzer.word_frequency.size.should eq 124 }
    end
  end

  describe "#results" do
    context "valid file" do
      let(:file) { fixture('lorem_ipsum.txt') }

      it { sentence_analyzer.sentences.size.should eq 39 }
    end
  end
end
