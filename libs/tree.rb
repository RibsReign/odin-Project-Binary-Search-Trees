# frozen_string_literal: true

require_relative 'array'
require_relative 'node'
require_relative 'tree_operations'
# t
class Tree
  include TreeOperations
  def initialize
    @data_array = nil
    @zero_root = nil
    @root_value = 0
    @tail = nil
  end

  def build_tree(data_array)
    p @data_array = data_array.merge_sort.uniq if @data_array.nil? # cleanup data_array on first run
    array_middle = ((@data_array.length - 1) / 2)
    @root_value = @data_array[array_middle]
    if @zero_root.nil?
      @zero_root = Node.new(@data_array[array_middle], make_root(0, array_middle),
                            make_root(array_middle, @data_array.length, false))
    end
    @zero_root
  end

  def make_root(arr_start, arr_end, is_left = true)
    array = @data_array[arr_start...arr_end]
    if array.length == 1
      node_from_one(array)
    elsif array.length == 2
      node_from_two(arr_start, arr_end, is_left)
    elsif array.length > 2
      node_from_array(arr_start, arr_end)
    end
  end

  def node_from_one(array)
    return nil if array[0] == @root_value

    Node.new(array[0], nil, nil)
  end

  def node_from_array(arr_start, arr_end)
    array_middle = ((arr_start + arr_end) / 2)
    Node.new(@data_array[array_middle], make_root(arr_start, array_middle),
             make_root(array_middle + 1, arr_end, false))
  end

  def node_from_two(arr_start, arr_end, is_left)
    array_middle = if is_left == true
                     ((arr_start + arr_end) / 2)
                   else
                     ((arr_start + arr_end) / 2) - 1
                   end
    Node.new(@data_array[array_middle], make_root(arr_start, array_middle),
             make_root(array_middle + 1, arr_end))
  end

  def visualize_tree(node = @zero_root, prefix = '', is_left = true)
    return if node.nil?

    visualize_tree(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    visualize_tree(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  # def node_found(node, _previous_node)
  #   p 'Start node found'
  #   p temp_node = node.right unless node.right.nil? || temp_node.right.nil?
  #   p temp_node = temp_node.left until temp_node.nil? || temp_node.left.nil?
  #   puts "Temp Node: #{temp_node.value}"
  # end
end
