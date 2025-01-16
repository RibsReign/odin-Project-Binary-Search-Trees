# frozen_string_literal: true

require_relative 'array'
require_relative 'node'

# t
class Tree
  def initialize
    @data_array = nil
    @zero_root = nil
    @root_value = 0
  end

  def build_tree(data_array)
    p @data_array = data_array.merge_sort.uniq if @data_array.nil? # cleanup data_array on first run
    array_middle = ((@data_array.length - 1) / 2)
    @root_value = @data_array[array_middle]
    if @zero_root.nil?
      @zero_root = Node.new(@data_array[array_middle], make_root(0, array_middle),
                            make_root(array_middle, @data_array.length, false))
    end
    # visualize_node(@zero_root)

    @zero_root
  end

  def make_root(arr_start, arr_end, is_left = true)
    array = @data_array[arr_start...arr_end]
    if array.length == 1
      return nil if array[0] == @root_value

      Node.new(array[0], nil, nil)
    elsif array.length == 2
      array_middle = if is_left == true
                       ((arr_start + arr_end) / 2)
                     else
                       ((arr_start + arr_end) / 2) - 1
                     end
      Node.new(@data_array[array_middle], make_root(arr_start, array_middle),
               make_root(array_middle + 1, arr_end))
    elsif array.length > 2

      array_middle = ((arr_start + arr_end) / 2)
      Node.new(@data_array[array_middle], make_root(arr_start, array_middle),
               make_root(array_middle + 1, arr_end, false))
    end
  end

  def insert(value, node = @zero_root)
    return if @data_array.include?(value)

    until value.nil?
      if value > node.value
        if node.right.nil?
          node.right = Node.new(value, nil, nil)
          break
        end
        node = node.right
      elsif value < node.value
        if node.left.nil?
          node.left = Node.new(value, nil, nil)
          break
        end
        node = node.left
      end
    end

    # end
  end

  def visualize_tree(node = @zero_root, prefix = '', is_left = true)
    return if node.nil?

    visualize_tree(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    visualize_tree(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
