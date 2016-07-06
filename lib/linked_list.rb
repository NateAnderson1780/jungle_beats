require_relative '../lib/node'
require 'pry'

class LinkedList
  attr_reader :head
  attr_accessor :count
  
  def initialize(head = nil)
    @head = head
    @count = 0
    @string = ""
  end
  
  def append(data)
    if @head.nil?
      @head = Node.new(data)
    else
      current = @head
      until current.next_node == nil
        current = current.next_node
      end
    current.next_node = Node.new(data)
    end
    @count += 1
    if @string == ""
      @string = data.to_s 
    else
      @string += " " + data.to_s 
    end
    return data
  end
  
  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
    else
      current = @head 
      @head = Node.new(data)
      @head.next_node = current 
    end
    if @string == ""
      @string = data.to_s
    else
      @string = data.to_s + " " + @string 
    end 
    @count += 1
    return data  
  end
  
  def insert(index, data)
    counter = 0
    current = @head
    if index == 0
      prepend(data)
    else
      while counter != index 
        previous = current 
        current = current.next_node
        counter += 1
      end 
      node_after_data = current 
      new_node = Node.new(data) 
      previous.next_node = new_node 
      new_node.next_node = node_after_data
    end 
    @count += 1
    @string = @string.split(" ").insert(index, data.to_s).join(" ")
    return data  
  end
  
  def find(position, elements_to_return)
    counter = 0
    current = @head  
    while position > counter 
      current = current.next_node
      counter += 1
    end 
    find_string = current.data.to_s
    current_node = 0
    while current_node < (elements_to_return - 1)
      current = current.next_node
      find_string += " " + current.data.to_s 
      current_node += 1
    end
    return find_string 
  end
  
  def include?(word)
    counter = 0 
    current = @head 
    while self.count > counter 
      if current.data == word 
        return true 
      end
      current = current.next_node
      counter += 1
    end
    return false
  end
  
  def pop 
    current = @head
    until current.next_node.next_node == nil
      current = current.next_node
    end
    popped_node = current.next_node.data 
    current.next_node = nil 
    @count -= 1
    @string = @string.split[0..-2].join(" ")
    binding.pry
    return popped_node
  end
  
  def to_string
    @string 
  end
  
end