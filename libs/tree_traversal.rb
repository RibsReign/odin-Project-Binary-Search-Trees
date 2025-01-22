# frozen_string_literal: true

# TreeTraversal
module TreeTraversal
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
end
