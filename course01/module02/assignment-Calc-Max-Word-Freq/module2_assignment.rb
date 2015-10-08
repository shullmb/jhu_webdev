#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content,         - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number, :dictionary
  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result

  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.
  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    @dictionary = Hash.new(0)
    calculate_word_frequency
    
  end
  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
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

#  Implement a class called Solution. 
class Solution

  # Implement the following read-only attributes in the Solution class.
  #* highest_count_across_lines - a number with the value of the highest frequency of a word
  #* highest_count_words_across_lines - an array with the words with the highest frequency
  attr_reader :highest_count_across_lines, :highest_count_words_across_lines
  attr_accessor :analyzers
  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers
  #* calculate_line_with_highest_frequency() - determines which line of
  #text has the highest number of occurrence of a single word
  #* print_highest_word_frequency_across_lines() - prints the words with the 
  #highest number of occurrences and their count
  def analyze_file()
    @analyzers = Array.new

    lines = File.readlines("test.txt")

    lines.each_with_index do |content, line_number|
      @analyzers << LineAnalyzer.new(content, line_number)
    end  

    #[LineAnalyzer.new("test.txt", 1), LineAnalyzer.new("test.txt", 2), LineAnalyzer.new("test.txt", 3)]
  end
  
  def calculate_line_with_highest_frequency()

  end

  def print_highest_word_frequency_across_lines()
    a = File.readlines("text.txt").split
    count = Hash.new(0)
    a.each do |x|
      count[x] += 1
    end
    sorted_dictionary = Hash.new[count.sort_by {|k,v| v }]
    @highest_count_words_across_lines = sorted_dictionary.keys.max_by
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
