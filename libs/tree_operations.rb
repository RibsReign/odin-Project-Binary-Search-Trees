# frozen_string_literal: true

# TreeOperations
module TreeOperations
  def insert(value, node = @zero_root)
    return if find(value)

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
    elsif node && value < node.value
      node.left = delete(value, node.left)
    else
      node.right = delete(value, node.right)
    end

    node
  end

  def find(value, node = @zero_root)
    return if node.nil?

    if value == node.value
      node
    elsif value < node.value
      find(value, node.left)
    else
      find(value, node.right)
    end
  end

  def level_order(node = @zero_root)
    return if node.nil?

    queue = [node]

    until queue.empty?
      current_node = queue.shift
      yield current_node if block_given?

      queue << current_node.left if current_node.left
      queue << current_node.right if current_node.right
    end
  end

  def inorder(node = @zero_root, &block)
    return if node.nil?

    inorder(node&.left, &block)
    yield node if block_given?
    inorder(node&.right, &block)
  end

  def preorder(node = @zero_root, &block)
    return if node.nil?

    yield node if block_given?
    preorder(node&.left, &block)
    preorder(node&.right, &block)
  end

  def postorder(node = @zero_root, &block)
    return if node.nil?

    postorder(node&.left, &block)
    postorder(node&.right, &block)
    yield node if block_given?
  end

  def depth(input, node = @zero_root, depth = 0)
    return if node.nil?

    depth += 1
    if input.value == node.value
      depth - 1
    elsif input.value < node.value
      find_depth(input.value, node.left, depth)
    else
      find_depth(input.value, node.right, depth)
    end
  end

  def height(node)
    return -1 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    [left_height, right_height].max + 1
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
