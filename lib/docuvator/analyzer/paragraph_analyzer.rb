module Docuvator
  class ParagraphAnalyzer
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def analyze

    end

    def results
      Log.info
      Log.info "::Paragraph Analyzer::"
      Log.info "Number of paragraphs: #{@data.paragraphs.size}"
    end
  end
end
