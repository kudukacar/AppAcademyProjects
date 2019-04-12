require 'byebug'

class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node)
        if @parent != node
            old_parent = @parent
            @parent = node
            PolyTreeNode.remove_node(old_parent,self) if !old_parent.nil?
            @parent.children << self  if !@parent.nil?
        end
    end

    def add_child(node)
        node.parent = self
    end

    def inspect
        @value.inspect
    end

    def remove_child(node)
        raise "node is root error" if node.parent.nil?
        node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        res = nil
        self.children.each do |child|
            res = child.dfs(target_value) 
            break if res
        end
        res
    end

    def bfs(target_value)
        queue = [self]
        while !queue.empty?
            node = queue.shift
            return node if node.value == target_value
            queue.push(*node.children)
        end
        nil
    end

    private
    def self.remove_node(parent, node)
        #debugger
        index = parent.children.index(node)
        parent.children.delete_at(index)
    end

end


# root = PolyTreeNode.new(2)
# #root.value = 2, parent = nil, children = nil
# parent = PolyTreeNode.new(1)
# p parent.children
# #root.value = 1, parent = nil, children = nil

# root.parent = parent

# p root
# p parent.children 