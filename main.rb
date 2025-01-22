# frozen_string_literal: true

require_relative 'libs/tree'
# tree = Tree.new

# tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

# tree.insert(1)
# tree.insert(9000)
# tree.insert(6)
# tree.insert(320)
# tree.insert(322)
# tree.visualize_tree
# tree.delete(5)
# tree.visualize_tree

# tree.delete(6)
# tree.visualize_tree
# tree.delete(67)
# tree.visualize_tree
# tree.delete(8)
# tree.visualize_tree
# # tree_two = Tree.new
# # tree_two.build_tree([33, 664, 387, 442, 414, 892, 313, 931, 134, 362,
# #                      396, 325, 666, 676, 746, 823, 836, 541, 590, 622,
# #                      78, 873, 632, 21, 159, 359, 915, 451, 524, 952,
# #                      760, 122, 485, 528, 963, 224, 820, 694, 269, 594])
# # tree_two.visualize_tree
# # tree_two.delete(528)
# # tree_two.visualize_tree
# # tree_two.delete(963)
# # tree_two.visualize_tree
# # tree_two.delete(952)
# # tree_two.visualize_tree
# # tree_two.delete(892)
# # tree_two.visualize_tree
# # p tree_two.find(33)
# # tree.level_order do |node|
# #   puts "Yielded node: #{node.value}, Left: #{node.left&.value}, Right: #{node.right&.value}"
# # end

# # tree.inorder do |node|
# #   puts "Yielded node: #{node.value}, Left: #{node.left&.value}, Right: #{node.right&.value}"
# # end
# # # tree.preorder do |node|
# # #   puts "Yielded node: #{node.value}, Left: #{node.left&.value}, Right: #{node.right&.value}"
# # # end

# p tree.depth(tree.find(1))
# p tree.depth(tree.find(3))
# p tree.depth(tree.find(9000))
# p tree.depth(tree.find(320))
# p tree.depth(tree.find(4))

# p tree.height(tree.find(1))
# p tree.height(tree.find(3))
# p tree.height(tree.find(9000))
# p tree.height(tree.find(320))
# p tree.height(tree.find(4))

# tree.postorder do |node|
#   puts "Yielded node: #{node.value}, Left: #{node.left&.value}, Right: #{node.right&.value}"
# end

# p tree.balanced?
# tree = tree.rebalance
# tree.visualize_tree

t_tree = Tree.new
t_tree.build_tree(Array.new(15) { rand(1..100) })
p t_tree.balanced?
print 'Level Order: '
t_tree.level_order do |node|
  print "#{node.value} "
end
print "\nPre Order: "
t_tree.preorder do |node|
  print "#{node.value} "
end
print "\nIn Order: "
t_tree.inorder do |node|
  print "#{node.value} "
end
print "\nPost Order: "
t_tree.postorder do |node|
  print "#{node.value} "
end
print "\n"
t_tree.insert(rand(100..200))
t_tree.insert(rand(100..200))
t_tree.insert(rand(100..200))
t_tree.insert(rand(100..200))
t_tree.insert(rand(100..200))
t_tree.insert(rand(100..200))
t_tree.insert(rand(100..200))
t_tree.insert(rand(100..200))
t_tree.insert(rand(100..200))
p t_tree.balanced?
t_tree = t_tree.rebalance
p t_tree.balanced?
print 'Level Order: '
t_tree.level_order do |node|
  print "#{node.value} "
end
print "\nPre Order: "
t_tree.preorder do |node|
  print "#{node.value} "
end
print "\nIn Order: "
t_tree.inorder do |node|
  print "#{node.value} "
end
print "\nPost Order: "
t_tree.postorder do |node|
  print "#{node.value} "
end
print "\n"
