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
    left_sum = node.value + sum(node.left)
    right_sum = sum(node.right)
    return left_sum + right_sum
  end
end
