# frozen_string_literal: true

# Class that handles the values and creates the nodes themselves
class Node
  # Include comparable module to handle comparisons between nodes
  include Comparable

  attr_accessor :value, :left_child, :right_child

  def initialize(value = nil, left_child = nil, right_child = nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
  end

  # def <=> (other)

  # end
end
