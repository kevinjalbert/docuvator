module Docuvator
  class Splitter
    attr_accessor :paragraphs, :sentences, :word_frequency
    attr_reader :file

    # Sentence ignore set
    IGNORE_SET = ['Mr', 'Mrs', 'Ms', 'Jr', 'Dr', 'Prof', 'Sr']

    REGEX_NEWLINE = Regexp.new(/\n+/)
    REGEX_SPACES = Regexp.new(/\s+/)
    REGEX_PUNCTUATION = Regexp.new(/[.!?,:;\[\]\(\)]+/)
    REGEX_SENTENCES = Regexp.new(/(?<=[.!?]|[.!?][\'"])(?<! #{IGNORE_SET.join('\\.| ') + '\\.|'} \s[A-Z]\.)\s+/ix)
=begin
Regex to split up sentences - http://stackoverflow.com/a/5844564/583592

(?<=                # Begin positive lookbehind.
  [.!?]             # Either an end of sentence punct,
| [.!?][\'"]        # or end of sentence punct and quote.
)                   # End positive lookbehind.
(?<!                # Begin negative lookbehind.
  Mr\.              # Skip either "Mr."
| Mrs\.             # or "Mrs.",
| Ms\.              # or "Ms.",
| Jr\.              # or "Jr.",
| Dr\.              # or "Dr.",
| Prof\.            # or "Prof.",
| Sr\.              # or "Sr.",
| \s[A-Z]\.         # or initials ex: "George W. Bush",
)                   # End negative lookbehind.
\s+                 # Split on whitespace between sentences.
/ix
=end

    def initialize(file)
      if File.exist? file
        @file = file
      else
        Log.error "Cannot split #{file} as it does not exist"
        exit 1
      end
    end

    def split
      # Split up text into paragraphs
      @paragraphs = File.open(@file).read.split(REGEX_NEWLINE).map { |s|
        s = s.gsub(REGEX_SPACES, ' ').strip
      }

      # Split up paragraphs into sentences
      @sentences = []
      @paragraphs.each do |paragraph|
        paragraph.split(REGEX_SENTENCES).each do |sentence|
          @sentences << sentence
        end
      end

      @word_frequency = Hash.new(0)
      @sentences.each do |sentence|
        sentence.split.map { |s|
          s = s.gsub(REGEX_PUNCTUATION, '').downcase
          @word_frequency[s] += 1
          s
        }
      end
    end
  end
end
