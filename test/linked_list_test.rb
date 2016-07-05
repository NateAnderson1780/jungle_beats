gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require 'pry'

class LinkedListTest < Minitest::Test 
  def test_head_is_nil_initially
    list = LinkedList.new
    
    assert_equal nil, list.head
  end
  
  def test_append_first_node
    list = LinkedList.new
    
    assert_equal "doop", list.append("doop")
  end
  
  def test_append_multiple_nodes
    list = LinkedList.new
    node_1_data = "doop"
    node_2_data = "deep"
    list.append(node_1_data)
    list.append(node_2_data)
    
    assert_equal 2, list.count
    assert_equal "doop deep", list.to_string
    assert_equal node_2_data, list.head.next_node.data 
  end
  
  def test_can_prepend_a_node
    list = LinkedList.new
    node_1_data = "plop"
    node_2_data = "suu"
    node_3_data = "dop"
    list.append(node_1_data)
    list.append(node_2_data)
    list.prepend(node_3_data)
    
    assert_equal "dop plop suu", list.to_string 
    assert_equal 3, list.count
    assert_equal "suu", list.head.next_node.next_node.data
  end
  
  def test_can_insert_node_at_position
    list = LinkedList.new 
    node_1_data = "plop"
    node_2_data = "suu"
    node_3_data = "dop"
    node_4_data = "woo"
    list.append(node_1_data)
    list.append(node_2_data)
    list.prepend(node_3_data)
    list.insert(1, node_4_data)
    
    assert_equal "dop woo plop suu", list.to_string 
    assert_equal 4, list.count
    assert_equal "woo", list.head.next_node.data
    
  end
  
  def test_can_find_nodes_at_specific_position
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")
    
    assert_equal "shi", list.find(2, 1)
  end
end