require "set"

def okay_two_sum?(array, target)
    return false if array.empty?
    array_sorted = array.sort
    first = array_sorted[0]
    dif = target - first
    return false if dif < first
    return true if b_search(array_sorted[1..-1], dif)
    okay_two_sum?(array_sorted[1..-1], target)
end

def b_search(array, target)
    return false if array.empty?
    mid = array.length/2
    case array[mid] <=> target
    when 0
        return true
    when 1
        b_search(array[0...mid], target)
    else
        return b_search(array[mid+1..-1], target)
    end 
end

def hash_map(array, target)
    return false if array.empty?
    set = array.to_set
    first = array.shift
    dif = target - first
    return true if set.include?(dif)
    hash_map(array, target)
end

