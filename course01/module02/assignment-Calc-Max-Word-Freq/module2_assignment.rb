class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number, :dictionary

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    @dictionary = Hash.new(0)
    @highest_wf_words = []
    calculate_word_frequency
    
  end

  def create_dictionary
    freq = self.content.split
    freq.each do |word|
      self.dictionary[word] += 1
    end
        
  end

  def calculate_word_frequency
    create_dictionary
    
    sorted_dictionary = Hash[self.dictionary.sort_by {|word, count| count }]

    @highest_wf_count = sorted_dictionary.values.last
    @highest_wf_words = sorted_dictionary.keys.max_by
  end
end

class Solution

  # Implement the following read-only attributes in the Solution class.
  #* highest_count_across_lines - a number with the value of the highest frequency of a word
  #* highest_count_words_across_lines - an array with the words with the highest frequency
  attr_accessor :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  
  def initialize
      @analyzers = []
  end

  def analyze_file()

    lines = File.readlines("test.txt")

    lines.each_with_index do |content, line_number|
      analyzer = LineAnalyzer.new(content, line_number)
      self.analyzers << analyzer
    end  

    
  end
  
  def calculate_line_with_highest_frequency()
    highest_wf = 0
    words = []
    analyzers.each_with_index do |analyzer, line_number|

      if analyzer.highest_wf_count > highest_wf
        highest_wf = analyzer.highest_wf_count
      end
      
      words << analyzer.highest_wf_words
    end

    self.highest_count_across_lines = highest_wf
  end

  def print_highest_word_frequency_across_lines()
    puts "The following words have the highest word frequency per line:"
    puts ""
  end

end
