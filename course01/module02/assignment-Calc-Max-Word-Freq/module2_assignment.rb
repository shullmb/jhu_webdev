class LineAnalyzer
  attr_accessor :highest_wf_count, :highest_wf_words, :content, :line_number, :dictionary

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    @dictionary = Hash.new(0)
    @highest_wf_words = []
    calculate_word_frequency
    
  end

  def create_dictionary
    freq = self.content.downcase.split
    freq.each do |word|
      self.dictionary[word] += 1
    end
        
  end

  def calculate_word_frequency
    create_dictionary
    
    sorted_dictionary = Hash[self.dictionary.sort_by {|word, count| count }]

    @highest_wf_count = sorted_dictionary.values.max

    self.dictionary.keys.each do |word|
      if self.dictionary[word] == self.highest_wf_count
        self.highest_wf_words << word
      end
    end
  end

end

class Solution

  attr_accessor :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  
  def initialize
      @analyzers = []
  end

  def analyze_file()

    lines = File.readlines("test.txt")

    lines.each_with_index do |content, line_number|
      analyzer = LineAnalyzer.new(content, line_number)
      analyzers << analyzer
    end  
    
  end
  
  def calculate_line_with_highest_frequency()
    highest_wf = 0
    analyzers.each_with_index do |analyzer, line_number|
      if analyzer.highest_wf_count > highest_wf
        highest_wf = analyzer.highest_wf_count
      end
    end

    self.highest_count_across_lines = highest_wf
    
    @highest_count_words_across_lines = []

    analyzers.each_with_index do |analyzer, line_number|
    	if analyzers[line_number].highest_wf_count == self.highest_count_across_lines
    		analyzers[line_number].highest_wf_words.each do |word|
        	
        	@highest_count_words_across_lines << word
      	end
    	end
    end

  end

  def print_highest_word_frequency_across_lines()
    puts "The following words have the highest word frequency per line:"
    puts "#{self.highest_count_words_across_lines.to_s}"
    puts "#{}#{}"
  end
 

end
