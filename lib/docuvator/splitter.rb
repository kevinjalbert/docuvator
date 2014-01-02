module Docuvator
  class Splitter
    attr_reader :file, :text

    def initialize(file)
      if File.exist? file
        @file = file
      else
        Log.error "Cannot split #{file} as it does not exist"
        exit 1
      end
    end

    def split
      @text = document file
      @text.apply(:chunk, :segment, :tokenize, :category)
      @text
    end
  end
end
