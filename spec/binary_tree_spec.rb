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

  describe "#sum" do
    it "returns the sum of all values in the tree" do
      expect(tree.sum).to eq(4)
    end

    it "returns the sum of all values in the tree" do
      tree.root.left = Node.new(5)

      expect(tree.sum).to eq(9)
    end

    it "returns the sum of all values in the tree" do
      tree.root.left = Node.new(5)
      tree.root.right = Node.new(6)

      expect(tree.sum).to eq(15)
    end

    it "returns the sum of all values in the tree" do
      tree.root.left = Node.new(5)
      tree.root.right = Node.new(6)
      tree.root.right.left = Node.new(5)

      expect(tree.sum).to eq(20)
    end

    it "returns the sum of all values in the tree" do
      tree.root.left = Node.new(5)
      tree.root.left.left = Node.new(5)
      tree.root.right = Node.new(6)
      tree.root.right.left = Node.new(5)
      tree.root.right.left = Node.new(5)

      expect(tree.sum).to eq(25)
    end
  end

  describe "#bfs" do
    it "returns the node if it is found in the tree" do
      tree.root.left = Node.new(5)
      tree.root.right = Node.new(7)
      node = tree.bfs(7)

      expect(node.value).to eq(7)
    end

    it "returns the node if it is found in the tree" do
      tree.root.left = Node.new(5)
      tree.root.right = Node.new(7)
      tree.root.right.right = Node.new(90)
      node = tree.bfs(90)

      expect(node.value).to eq(90)
    end
  end

  xdescribe "#binary_tree?" do
    it "returns true if a tree is a binary tree" do
      tree.root.left = Node.new(3)
      tree.root.right = Node.new(8)

      expect(tree.binary_tree?).to be true
    end

    it "returns true if a tree is a binary tree" do
      tree.root.left = Node.new(3)
      tree.root.right = Node.new(8)
      tree.root.left.left = Node.new(2)
      tree.root.left.right = Node.new(5)
      tree.root.right.left = Node.new(6)
      tree.root.right.right = Node.new(10)

      expect(tree.binary_tree?).to be true
    end

    it "returns false if a tree is not a binary tree" do
      tree.root.left = Node.new(10)
      tree.root.right = Node.new(20)

      expect(tree.binary_tree?).to be true
    end

    it "returns false if a tree is not a binary tree" do
      tree.root.left = Node.new(3)
      tree.root.right = Node.new(8)
      tree.root.left.left = Node.new(10)
      tree.root.left.right = Node.new(5)
      tree.root.right.left = Node.new(6)
      tree.root.right.right = Node.new(10)

      expect(tree.binary_tree?).to be true
    end
  end
end
