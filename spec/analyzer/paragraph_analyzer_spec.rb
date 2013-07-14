require 'spec_helper'

include Docuvator

describe ParagraphAnalyzer do
  let(:splitter) {
    splitter = Splitter.new(file)
    splitter.split
    splitter
  }

  let(:paragraph_analyzer) { ParagraphAnalyzer.new(splitter.paragraphs, splitter.sentences, splitter.word_frequency) }

  context "initializes instance" do
    context "with valid data" do
      let(:file) { fixture('lorem_ipsum.txt') }

      it { paragraph_analyzer.paragraphs.size.should eq 3 }
      it { paragraph_analyzer.sentences.size.should eq 39 }
      it { paragraph_analyzer.word_frequency.size.should eq 124 }
    end
  end

  describe "#results" do
    context "valid file" do
      let(:file) { fixture('lorem_ipsum.txt') }

      it { paragraph_analyzer.paragraphs.size.should eq 3 }
    end
  end
end
