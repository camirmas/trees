require 'node'

class BinaryTree
  attr_accessor :root

  def initialize(value)
    @root = Node.new(value)
  end

  def dfs(value, root=@root)
    if root.value == value
      return root
    elsif root.left
      return dfs(value, root.left)
    elsif root.right
      return dfs(value, root.right)
    else
      return
    end
  end
end
