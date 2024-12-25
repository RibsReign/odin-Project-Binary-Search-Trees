# odin-Project-Binary-Search-Trees

Dashboard
All Paths
Community
Support us
View notifications
Project: Binary Search Trees
Ruby Course
Introduction

You have learned about binary search trees, where you take a group of data items and turn them into a tree full of nodes, with each left node being “lower” than each right node. The tree starts with the “root node” and any node with no children is called a “leaf node”. You have also learned about tree traversal algorithms like breadth-first and depth-first.

Now, let’s take a look at balanced binary search trees (BST). A BST allows fast operations for lookup, insertion, and deletion of data items. Read this article on building balanced BSTs. Here is a video on building balanced BSTs as well. Although these two resources do not use Ruby, you should understand it enough to develop your own pseudocode.
Assignment

You’ll build a balanced BST in this assignment. Do not use duplicate values because they make it more complicated and result in trees that are much harder to balance. Therefore, be sure to always remove duplicate values or check for an existing value before inserting.

    Build a Node class. It should have an attribute for the data it stores as well as its left and right children. As a bonus, try including the Comparable module and compare nodes using their data attribute.

    Build a Tree class which accepts an array when initialized. The Tree class should have a root attribute, which uses the return value of #build_tree which you’ll write next.

    Write a #build_tree method which takes an array of data (e.g., [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a balanced binary tree full of Node objects appropriately placed (don’t forget to sort and remove duplicates!). The #build_tree method should return the level-0 root node.

    Tip: If you would like to visualize your binary search tree, here is a #pretty_print method that a student wrote and shared on Discord:

     def pretty_print(node = @root, prefix = '', is_left = true)
       pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
       puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
       pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
     end

    Write an #insert and #delete method which accepts a value to insert/delete. You’ll have to deal with several cases for delete, such as when a node has children or not. If you need additional resources, check out these two articles on inserting and deleting, or this video on BST inserting/removing with several visual examples.

    You may be tempted to implement these methods using the original input array, but it’s important for the efficiency of these operations that you don’t do this. If we refer back to the Big O Cheatsheet, we’ll see that binary search trees can insert/delete in O(log n) time, which is a significant performance boost over arrays for the same operations. To get this added efficiency, your implementation of these methods should traverse the tree and manipulate the nodes and their connections.

    Write a #find method which accepts a value and returns the node with the given value.

    Write a #level_order method which accepts a block. This method should traverse the tree in breadth-first level order and yield each node to the provided block. This method can be implemented using either iteration or recursion (try implementing both!). The method should return an array of values if no block is given. Tip: You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to traverse, and to add new ones to the list (video on level order traversal).

    Write #inorder, #preorder, and #postorder methods that accepts a block. Each method should traverse the tree in their respective depth-first order and yield each node to the provided block. The methods should return an array of values if no block is given.

    Write a #height method that accepts a node and returns its height. Height is defined as the number of edges in longest path from a given node to a leaf node.

    Write a #depth method that accepts a node and returns its depth. Depth is defined as the number of edges in path from a given node to the tree’s root node.

    Write a #balanced? method that checks if the tree is balanced. A balanced tree is one where the difference between heights of left subtree and right subtree of every node is not more than 1.

    Write a #rebalance method which rebalances an unbalanced tree. Tip: You’ll want to use a traversal method to provide a new array to the #build_tree method.

Tie it all together

Write a driver script that does the following:

    Create a binary search tree from an array of random numbers (Array.new(15) { rand(1..100) })
    Confirm that the tree is balanced by calling #balanced?
    Print out all elements in level, pre, post, and in order
    Unbalance the tree by adding several numbers > 100
    Confirm that the tree is unbalanced by calling #balanced?
    Balance the tree by calling #rebalance
    Confirm that the tree is balanced by calling #balanced?
    Print out all elements in level, pre, post, and in order.
