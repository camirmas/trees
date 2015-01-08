require 'node'

class BinaryTree
  attr_accessor :root

  def initialize(value)
    @root = Node.new(value)
  end

  def dfs(value, node=@root)
    return nil if !node
    return node if node.value == value
    return dfs(value, node.left) || dfs(value, node.right)
  end

  def sum(node=@root)
    return 0 if !node
    return node.value + sum(node.left) + sum(node.right)
  end

  def bfs(seeking, nodes=[node=@root])
    node_children = []

    nodes.each do |node|
      return node if node.value == seeking
      nodes << node.left if node.left
      nodes << node.right if node.right
    end

    return bfs(seeking, node_children)
  end

  def binary_tree?(node=@root)
  end
end
