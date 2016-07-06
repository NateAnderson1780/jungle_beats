require_relative '../lib/linked_list'
require 'pry'

class JungleBeat 
  attr_reader :list
  
  def initialize
    @list = LinkedList.new 
  end
  
  def play
    
  end
  
  def append(input)
    input.split.each do |word|
      @list.append(word)
    end
    input
  end
  
  def count 
    list.count 
  end
end