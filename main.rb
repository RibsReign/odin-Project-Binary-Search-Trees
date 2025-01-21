# frozen_string_literal: true

require_relative 'libs/tree'
tree = Tree.new

tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

tree.insert(1)
tree.insert(9000)
tree.insert(6)
tree.insert(320)
tree.insert(322)
tree.visualize_tree
tree.delete(5)
tree.visualize_tree

tree.delete(6)
tree.visualize_tree
tree.delete(67)
tree.visualize_tree
tree.delete(8)
tree.visualize_tree

# tree_two = Tree.new
# tree_two.build_tree([33, 664, 387, 442, 414, 892, 313, 931, 134, 362,
#                      396, 325, 666, 676, 746, 823, 836, 541, 590, 622,
#                      78, 873, 632, 21, 159, 359, 915, 451, 524, 952,
#                      760, 122, 485, 528, 963, 224, 820, 694, 269, 594])
# tree_two.visualize_tree
# tree_two.delete(528)
# tree_two.visualize_tree
# tree_two.delete(963)
# tree_two.visualize_tree
# tree_two.delete(952)
# tree_two.visualize_tree
# tree_two.delete(892)
# tree_two.visualize_tree
# p tree_two.find(33)
# tree.level_order do |node|
#   puts "Yielded node: #{node.value}, Left: #{node.left&.value}, Right: #{node.right&.value}"
# end

# tree.inorder do |node|
#   puts "Yielded node: #{node.value}, Left: #{node.left&.value}, Right: #{node.right&.value}"
# end
# # tree.preorder do |node|
# #   puts "Yielded node: #{node.value}, Left: #{node.left&.value}, Right: #{node.right&.value}"
# # end
tree.postorder do |node|
  puts "Yielded node: #{node.value}, Left: #{node.left&.value}, Right: #{node.right&.value}"
end
p tree.height(1)
# unsorted_tree = Tree.new
# unsorted_tree.build_tree([1, 7, 4, 23, 8, 9, 4, 5, 7, 9, 67, 6345, 324])
# unsorted_tree.visualize_tree
