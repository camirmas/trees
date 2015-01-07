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
end
