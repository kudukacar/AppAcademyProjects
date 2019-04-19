require 'byebug'
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new(:head,nil)
    @tail = Node.new(:tail,nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return @head.next if @head.next != @tail
    nil
  end

  def last
    return @tail.prev if @tail.prev != @head
    nil
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_node = first
    until current_node == @tail
      return current_node.val if current_node.key == key
      current_node = current_node.next
    end
    nil
  end

  def include?(key)
    current_node = first
    # debugger
    until current_node == @tail || first == nil
      return true if current_node.key == key
      current_node = current_node.next
    end
    false
  end

  def append(key, val)
    new_last_node = Node.new(key,val)
    new_2nd_last_node = @tail.prev
    new_2nd_last_node.next = new_last_node
    @tail.prev = new_last_node
    new_last_node.next = @tail
    new_last_node.prev = new_2nd_last_node  
    new_last_node
  end

  def append_node(new_last_node)
    new_2nd_last_node = @tail.prev
    new_2nd_last_node.next = new_last_node
    @tail.prev = new_last_node
    new_last_node.next = @tail
    new_last_node.prev = new_2nd_last_node  
  end

  def update(key, val)
    found_node = get_node(key)
    found_node.val = val if found_node != nil
  end

  def remove(key)
    found_node = get_node(key)
    found_node.remove
    found_node
  end


  def remove_node(delete_node)
    delete_node.remove
    delete_node
  end


  def each
    current_node = first
    array = []
    until current_node == @tail
      array << yield(current_node)
      current_node = current_node.next
    end
    array
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
  private 
  def get_node(key)
    # return nil if first == nil
    current_node = first
    until current_node == @tail || current_node == nil
      # debugger
      return current_node if current_node.key == key
      current_node = current_node.next

    end
    nil
  end
end
