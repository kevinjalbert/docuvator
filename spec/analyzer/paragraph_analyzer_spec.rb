require 'spec_helper'

include Docuvator

describe ParagraphAnalyzer do
  let(:splitter) {
    splitter = Splitter.new(file)
    splitter.split
  }

  let(:paragraph_analyzer) { ParagraphAnalyzer.new(splitter) }

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
