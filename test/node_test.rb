gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_adding_a_node
    node = Node.new("plop")
    
    assert_equal "plop", node.data
    assert_equal nil, node.next_node
  end
end