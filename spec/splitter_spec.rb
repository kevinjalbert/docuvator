require 'spec_helper'

include Docuvator

describe Splitter do
  let(:splitter) { Splitter.new(file) }

  context "initializes instance" do
    context "with valid file" do
      let(:file) { fixture('lorem_ipsum.txt') }
      it { splitter.file.should eq file }
    end
    context "with invalid file" do
      let(:file) { fixture('invalid.txt') }
      it { lambda { splitter }.should raise_error SystemExit }
    end
  end

  describe "#split" do
    context "valid file" do
      let(:file) { fixture('lorem_ipsum.txt') }
      let(:split) {
        splitter = Splitter.new(file)
        splitter.split
        splitter
      }

      it { split.paragraphs.size.should eq 3 }
      it { split.sentences.size.should eq 39 }
      it { split.word_frequency.size.should eq 124 }
    end

    context "valid file (idempotence)" do
      let(:file) { fixture('lorem_ipsum.txt') }
      let(:split) {
        splitter = Splitter.new(file)
        splitter.split
        splitter.split
        splitter
      }

      it { split.paragraphs.size.should eq 3 }
      it { split.sentences.size.should eq 39 }
      it { split.word_frequency.size.should eq 124 }
    end
  end
end
