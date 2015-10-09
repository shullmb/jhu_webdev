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
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  
  def initialize
      @analyzers = []
  end
  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers
  #* calculate_line_with_highest_frequency() - determines which line of
  #text has the highest number of occurrence of a single word
  #* print_highest_word_frequency_across_lines() - prints the words with the 
  #highest number of occurrences and their count
  def analyze_file()

    lines = File.readlines("test.txt")

    lines.each_with_index do |content, line_number|
      analyzer = LineAnalyzer.new(content, line_number)
      self.analyzers << analyzer.content.split
    end  

    
  end
  
  def calculate_line_with_highest_frequency()
    # dictionary = Hash.new(0)
    # self.analyzers.each do |word|
    #   dictionary[word] += 1
    # end
    # sorted_dictionary = Hash.new[dictionary.sort_by {|k,v| v }]
    # @highest_count_across_lines = sorted_dictionary.values.max
    # @highest_count_words_across_lines = sorted_dictionary.keys.max_by

  end

  def print_highest_word_frequency_across_lines()
    puts "The following words have the highest word frequency per line:"
    puts ""
  end
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the highest number of occurences of a word across all lines
  #and stores this result in the highest_count_across_lines attribute.
  #* identifies the words that were used with the highest number of occurrences
  #and stores them in print_highest_word_frequency_across_lines.

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the result in the following format
end
