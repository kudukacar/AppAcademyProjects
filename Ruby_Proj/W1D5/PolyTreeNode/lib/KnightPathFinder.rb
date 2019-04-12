require_relative '00_tree_node.rb'
require 'set' 
require 'byebug'
class KnightPathFinder
    def initialize(start)
        @start = start
        @last = [3,3]
        
        @grid = Array.new(8) {Array.new(8)}
        
        @root_node = PolyTreeNode.new(start)

        @considered_positions = Set.new([start])
        p @considered_positions
    end

    def new_move_positions(pos)
        #debugger
        all_moves = KnightPathFinder.generate_moves(pos).select do |move| 
            KnightPathFinder.valid_moves(move) && !@considered_positions.include?(move)
        end
        all_moves.each {|move| @considered_positions.add(move)}
        all_moves
        #debugger
    end

    def populate
        (0...grid.length).each do |row|
            (0...grid.length).each do |col|
                grid[row][col] = PolyTreeNode.new([row, col])
            end
        end
    end

    def []=(pos, value)
        x, y = pos
        grid[x][y] = value
    end

    def [](pos)
        x, y = pos
        grid[x][y] 
    end

    def build_move_tree
        queue = [@start]
        queue2 = [@root_node]
        
        while !queue.empty?
            pos = queue.shift
            parent_node = queue2.shift
            
            all_moves = new_move_positions(pos)
            
            all_moves.each  do |move| 
                child_node = PolyTreeNode.new(move)
                parent_node.add_child(child_node)
                queue2 << child_node
            end 

            queue.push(*all_moves)
        end
    
        generic_bfs(@root_node)
    end
    
    def generic_bfs(root)
        queue = [root]
        while !queue.empty?
            node = queue.shift
            puts "Current Node: #{node.value}"
            puts "Node Children #{node.children}" if !node.children.empty?
            queue.push(*node.children)
            puts
            puts
        end
    end
    
    private
    attr_accessor :grid

    def self.valid_moves(pos)
        x, y = pos
        (0...8).include?(x) && (0...8).include?(y)
    end

    def self.generate_moves(pos)
        x, y = pos
        positions = []
        positions << [x + 2, y + 1]
        positions << [x + 1, y + 2]
        positions << [x - 1, y + 2]
        positions << [x - 2, y + 1]
        positions << [x - 2, y - 1]
        positions << [x - 1, y - 2]
        positions << [x + 1, y - 2]
        positions << [x + 2, y - 1]
        return positions
    end
end


bfs = KnightPathFinder.new([0,0])

bfs.build_move_tree