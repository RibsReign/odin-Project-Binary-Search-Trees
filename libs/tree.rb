# frozen_string_literal: true

require_relative 'array'
require_relative 'node'

# t
class Tree
  def initialize
    @data_array = nil
    @zero_root = nil
  end

  def build_tree(data_array)
    p @data_array = data_array.merge_sort.uniq if @data_array.nil? # cleanup data_array on first run
    array_middle = ((@data_array.length - 1) / 2)
    p @data_array[array_middle]
    if @zero_root.nil?
      @zero_root = Node.new(@data_array[array_middle], make_root(0, array_middle),
                            make_root(array_middle, @data_array.length, false))
    end
    # visualize_node(@zero_root)

    p @zero_root
  end

  def make_root(arr_start, arr_end, is_left = true)
    array = @data_array[arr_start...arr_end]
    if array.length == 1
      Node.new(array[0], nil, nil)
    elsif array.length == 2
      array_middle = if is_left == true
                       ((arr_start + arr_end) / 2)
                     else
                       ((arr_start + arr_end) / 2) - 1
                     end
      Node.new(@data_array[array_middle], make_root(arr_start, array_middle),
               make_root(array_middle + 1, arr_end))
    elsif array.length > 1
      array_middle = ((arr_start + arr_end) / 2)
      Node.new(@data_array[array_middle], make_root(arr_start, array_middle),
               make_root(array_middle + 1, arr_end, false))
    end
  end

  def visualize_tree(node = @zero_root, prefix = '', is_left = true)
    return if node.nil?

    visualize_tree(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    visualize_tree(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end
