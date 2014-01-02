require 'spec_helper'

include Docuvator

describe SentenceAnalyzer do
  let(:splitter) {
    splitter = Splitter.new(file)
    splitter.split
  }

  let(:sentence_analyzer) { SentenceAnalyzer.new(splitter) }

  context "initializes instance" do
    context "with valid data" do
      let(:file) { fixture('lorem_ipsum.txt') }

    end
  end

  describe "#results" do
    context "valid file" do
      let(:file) { fixture('lorem_ipsum.txt') }

    end
  end
end
