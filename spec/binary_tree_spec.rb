require 'spec_helper'
require 'node'
require 'binary_tree'

describe BinaryTree do
  let(:tree) { BinaryTree.new(4) }

  context "when it initializes" do
    it "is a binary tree" do
      expect(tree.class).to eq(BinaryTree)
    end

    it "has a root" do
      expect(tree.root.value).to eq(4)
    end
  end

  describe "#dfs" do
    it "returns a node if it is the root in the tree" do
      node = tree.dfs(4)

      expect(node.value).to eq(4)
    end

    it "returns a node if it is the first left or right in the tree" do
      tree.root.left = Node.new(5)
      tree.root.right = Node.new(6)
      left_node = tree.dfs(5)

      expect(left_node.value).to eq(5)
    end

    it "returns a node if it is the first left or right in the tree" do
      tree.root.left = Node.new(5)
      tree.root.right = Node.new(6)
      right_node = tree.dfs(5)

      expect(right_node.value).to eq(5)
    end

    it "returns a node if it is multiple levels down in the tree" do
      tree.root.left = Node.new(5)
      tree.root.left.left = Node.new(10)
      node = tree.dfs(10)

      expect(node.value).to eq(10)
    end

    it "returns a node if it is multiple levels down in the tree" do
      tree.root.left = Node.new(5)
      tree.root.left.right = Node.new(10)
      node = tree.dfs(10)

      expect(node.value).to eq(10)
    end
  end
end
