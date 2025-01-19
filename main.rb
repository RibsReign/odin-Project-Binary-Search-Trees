# frozen_string_literal: true

require_relative 'libs/tree'
tree = Tree.new

tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

tree.insert(1)
tree.insert(9000)
tree.insert(6)
tree.visualize_tree
tree.delete(5)
tree.visualize_tree

tree.delete(6)
tree.visualize_tree

# unsorted_tree = Tree.new
# unsorted_tree.build_tree([1, 7, 4, 23, 8, 9, 4, 5, 7, 9, 67, 6345, 324])
# unsorted_tree.visualize_tree
