# frozen_string_literal: true

# Class that handles the values and creates the nodes themselves
class Node
  # Include comparable module to handle comparisons between nodes
  include Comparable

  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  # def <=> (other)

  # end
end
