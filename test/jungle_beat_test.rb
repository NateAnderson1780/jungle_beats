gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'
require 'pry'

class JungleBeatTest < Minitest::Test 
  def test_will_initialize_a_list 
    jb = JungleBeat.new
    
    assert_instance_of LinkedList, jb.list
    assert_equal nil, jb.list.head  
  end
  
  def test_will_add_multiple_nodes_at_once
    jb = JungleBeat.new
    
    input = "deep doo ditt"
    
    assert_equal 3, jb.append(input)
    assert_equal "deep", jb.list.head.data 
    assert_equal "doo", jb.list.head.next_node.data
  end
  
  def test_will_add_multiple_nodes_multiple_times
    jb = JungleBeat.new
    
    input1 = "deep doo ditt"
    input2 = "deep doo ditt"
    
    assert_equal 3, jb.append(input1)
    assert_equal 3, jb.append(input2)
    assert_equal 6, jb.count 
  end
  
  def test_input_beat_part_of_defined_list
    jb = JungleBeat.new
    jb.append("deep")
    
    assert_equal 0, jb.append("Mississippi")
    assert_equal "deep", jb.all
  end
  
  def test_prepend_multiple_beats_and_invalid_beat
    jb = JungleBeat.new
    jb.append("deep")
    
    assert_equal 0, jb.append("Mississippi")
    assert_equal "deep", jb.all
    assert_equal 3, jb.prepend("woo woo woo Mississippi")
    assert_equal "woo woo woo deep", jb.all 
  end
end