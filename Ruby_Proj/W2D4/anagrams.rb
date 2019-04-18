def first_anagram?(str_1, str_2)
    anagram_array = []
    array_1 = str_1.split("")
    while i < factorial(str_1.length)
        anagram = array_1.shuffle.join("")
        anagram_array << anagram unless anagram_array.include?(anagram)
    end
    anagram_array.include?(str_2)
end

def factorial(n)
return 1 if n == 1
n * factorial(n-1)
end

def second_anagram?(str_1, str_2)
    array = str_2.split("")

    str_1.each_char do |char|
        array.delete_at(array.index(char)) if array.include?(char)
    end
    array.empty?
end

def third_anagram?(str_1, str_2)
    array1 = str_1.split("")
    array2 = str_2.split("")
    array1.sort == array2.sort
end

def fourth_anagram?(str_1, str_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)
    str_1.each_char do |char_1|
        hash_1[char_1] += 1
    end
    str_2.each_char do |char_2|
        hash_2[char_2] += 1
    end

    hash_1 == hash_2
end