require_relative '../lib/linked_list'
require 'pry'

class JungleBeat 
  attr_reader :list
  
  def initialize
    @list = LinkedList.new 
    @rate = 500
    @voice = "Boing"
  end
  
  def play
    `say -r #{@rate} -v #{@voice} #{@list.to_string}`
    count 
  end
  
  def append(input)
    input = validate_beats(input)
    initial_list_count = count 
    
    input.split.each do |word|
      @list.append(word)
    end
    
    count - initial_list_count 
  end
  
  def prepend(input)
    initial_list_count = count 
    input = validate_beats(input)
    
    input.split.each do |word|
      @list.prepend(word)
    end
    
    count - initial_list_count 
  end
  
  def validate_beats(beats)
    valid_beats = ["deep", "woo", "shi", "shu", "blop", 
             "doop", "plop", "suu", "dop", "doo", "ditt"]
    beats_array = beats.split(" ")
    new_beats_array = []
    
    beats_array.each do |beat|
      new_beats_array << beat if valid_beats.include?(beat)
    end
    # new_beats_array = valid_beats & beats_array 
    new_beats = new_beats_array.join(" ")        
  end
  
  def count 
    list.count 
  end
  
  def all 
    list.to_string 
  end
  
  def rate(speed) 
    @rate = speed 
  end
  
  def reset_rate
    @rate = 500 
  end
  
  def voice(the_voice)
    @voice = the_voice 
  end
  
  def reset_voice
    @voice = "Boing"
  end
end