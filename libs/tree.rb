# frozen_string_literal: true

require_relative 'array'
require_relative 'node'

# t
class Tree
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
  end

  def delete(value, node = @zero_root, previous_node = @zero_root)
    loop do
      if node.value == value
        if no_children?(node)
          previous_node = no_children(node, previous_node)
        elsif one_child?(node)
          previous_node = one_child(node, previous_node)
        else # two children
          hold_branch = node.left
          replacement = two_children_value(node)
          node.value = replacement.value
          node.left = hold_branch
        end
        return @zero_root
      end
      previous_node = node
      if value > node.value
        node = node.right
      elsif value < node.value
        node = node.left
      end
    end
  end

  def no_children?(node)
    node.right.nil? && node.left.nil?
  end

  def no_children(node, previous_node)
    if previous_node.left == node
      previous_node.left = nil
    elsif previous_node.right == node
      previous_node.right = nil
    end
    previous_node
  end

  def one_child?(node)
    (node.right.nil? && !node.left.nil?) || (node.left.nil? && !node.right.nil?)
  end

  def one_child(node, previous_node)
    if previous_node.left == node
      previous_node.left = reassign_child(node)
    elsif previous_node.right == node
      previous_node.right = reassign_child(node)
    end
    previous_node
  end

  def reassign_child(node)
    if node.right.nil? && !node.left.nil?
      node = node.left
    elsif node.left.nil? && !node.right.nil?
      node = node.right
    end
    node
  end

  def two_children_value(node)
    replacement = node.right
    parent = node
    until replacement.left.nil?
      parent = replacement
      replacement = replacement.left
    end
    parent.left = replacement.right
    replacement
  end

  def replace_root(node)
    replacement = node.right
    right_branch = replacement.right
    sub_node_value = replacement.value
    replacement = replacement.left until replacement.left.nil?
    # if replacement.right.nil?
    p "I am the replacement  #{replacement.value}"
    Node.new(sub_node_value, nil, right_branch)
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
