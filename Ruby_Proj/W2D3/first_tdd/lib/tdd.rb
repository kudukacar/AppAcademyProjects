require "byebug"

def my_uniq(array)
    uniq_array = []
    array.each {|ele| uniq_array << ele unless uniq_array.include?(ele)}
    uniq_array
end

class Array
    def two_sum
        pairs = []
        self.each_with_index do |ele1, i|
            self.each_with_index do |ele2, j|
                pairs << [i, j] if ele1 + ele2 == 0 && j > i
            end
        end
        pairs
    end
end

def my_transpose(array)
    transposed = Array.new(array.length) {Array.new(array.length)}
    array.each_with_index do |row, row_idx|
        row.each_with_index do |col, col_idx|
            transposed[col_idx][row_idx] = array[row_idx][col_idx]
        end
    end
    transposed
end

def stock_picker(array)
    best_days = [0, 1]
    best_diff = array[1] - array[0]
    (0...array.length-1).each do |i|
        (i+1...array.length).each do |j|
            diff = array[j] - array[i]
            if diff > best_diff
                best_diff = diff
                best_days[0], best_days[1] = i, j 
            end
        end
    end
    best_days
end

class Towers_of_Hanoi
    attr_accessor :rods

    def initialize
        @rods = [[3, 2, 1], [], []]
    end

    def valid_move?(start, final)

        if rods[final].empty?
            true
        elsif rods[start].last > rods[final].last
            raise "You must stack smaller on top of larger disks"
        elsif start == final
            raise "You must move a disk to a different pile"
        end
        true
    end

    def move(start, final)
        rods[final].push(rods[start].pop) if valid_move?(start,final)
    end

    def won
        return true if @rods[1].length == 3 || @rods[2].length == 3
        false
    end
end

