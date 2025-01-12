# frozen_string_literal: true

require_relative 'libs/tree'
unsorted_tree = Tree.new

unsorted_tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
unsorted_tree.visualize_tree

# unsorted_tree = Tree.new
# unsorted_tree.build_tree([1, 7, 4, 23, 8, 9, 4, 5, 7, 9, 67, 6345, 324])
# unsorted_tree.visualize_tree
