require 'spec_helper'
require 'node'

describe Node do
  context "when it is initialized" do
    it "has a value" do
      node = Node.new("root")

      expect(node.value).to eq("root")
    end

    it "has a left node" do
      node = Node.new("root")
      node.left = Node.new(1)

      expect(node.left.class).to eq(Node)
      expect(node.left.value).to eq(1)
    end

    it "has a right node" do
      node = Node.new("root")
      node.right = Node.new(1)

      expect(node.right.class).to eq(Node)
      expect(node.right.value).to eq(1)
    end
  end
end
