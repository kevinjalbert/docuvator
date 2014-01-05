module Docuvator
  class Analyzer
    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

    def analyze
      raise "method is not defined for #{self.class}"
    end

    def results
      raise "method is not defined for #{self.class}"
    end
  end
end
