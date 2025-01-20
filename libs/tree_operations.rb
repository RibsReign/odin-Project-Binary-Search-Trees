# frozen_string_literal: true

# TreeOperations
module TreeOperations
  def insert(value, node = @zero_root)
    return if @data_array.include?(value)

    until value.nil?
      if value > node.value
        return node.right = Node.new(value, nil, nil) if node.right.nil?

        node = node.right
      elsif value < node.value
        return node.left = Node.new(value, nil, nil) if node.left.nil?

        node = node.left
      end
    end
  end

  def delete(value, node = @zero_root)
    return @zero_root if node.nil?

    if value == node.value
      node = delete_node(node)
    elsif value < node.value
      node.left = delete(value, node.left)
    else
      node.right = delete(value, node.right)
    end

    node
  end

  def find(value, node = @zero_root)
    if value == node.value
      node
    elsif value < node.value
      find(value, node.left)
    else
      find(value, node.right)
    end
  end

  private

  def delete_node(node)
    if node.left.nil? && node.right.nil? # no_children
      return nil
    elsif node.left.nil? || node.right.nil? # one_child
      return single_child(node)
    else # two children
      replace_with_inorder_successor(node)
    end

    node
  end

  def single_child(node)
    node.left || node.right
  end

  def replace_with_inorder_successor(node)
    min_node = find_min(node.right)
    node.value = min_node.value
    node.right = delete(min_node.value, node.right)
  end

  def find_min(node)
    node = node.left until node.left.nil?
    node
  end

  # def delete(value, node = @zero_root, previous_node = nil)
  #   loop do
  #     return @zero_root if node.nil?

  #     if node.value == value
  #       if node.left.nil? && node.right.nil? # no children
  #         previous_node = no_children(node, previous_node)
  #       elsif node.left.nil? || node.right.nil? # one child
  #         previous_node = one_child(node, previous_node)
  #       else # two children
  #         hold_branch = node.left
  #         replacement = two_children_value(node)
  #         node.value = replacement.value
  #         node.left = hold_branch
  #       end
  #       return @zero_root # return the updated tree
  #     end

  #     previous_node = node
  #     node = value > node.value ? node.right : node.left
  #   end
  # end

  # def no_children(node, previous_node)
  #   if previous_node.left == node
  #     previous_node.left = nil
  #   elsif previous_node.right == node
  #     previous_node.right = nil
  #   end
  #   previous_node
  # end

  # def one_child(node, previous_node)
  #   if previous_node.left == node
  #     previous_node.left = reassign_child(node)
  #   elsif previous_node.right == node
  #     previous_node.right = reassign_child(node)
  #   end
  #   previous_node
  # end

  # def reassign_child(node)
  #   if node.right.nil? && !node.left.nil?
  #     node = node.left
  #   elsif node.left.nil? && !node.right.nil?
  #     node = node.right
  #   end
  #   node
  # end

  # def two_children_value(node)
  #   replacement = node.right
  #   parent = node
  #   until replacement.left.nil?
  #     parent = replacement
  #     replacement = replacement.left
  #   end
  #   parent.left = replacement.right
  #   replacement
  # end
end
