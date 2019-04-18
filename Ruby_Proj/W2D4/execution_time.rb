def my_min(array)
    min = nil
    array.each do |ele|
        min = ele if array.all? { |ele_2| ele <= ele_2 }
    end                
    min
end

def my_min2(array)
    min = array[0]
    array.each do |ele|
       min = ele if ele < min
    end                
    min
end

def largest(array)
    array_new = []
    array.each_with_index do |ele_1, i_start|
        array.each_with_index do |ele_2, i_end|
            array_new << array[i_start..i_end]
        end
    end
    max = array_new[0].sum
    array_new.each do |subset|
        max = subset.sum if subset.sum > max
    end
    max
end


def largest2(array)
    max = array[0]
    running_sum = 0

    return array.max if array.all? { |ele| ele < 0}

    array.each do |ele|
        running_sum = 0 if running_sum < 0
        running_sum += ele
        max = running_sum if running_sum > max
    end

    max
end


