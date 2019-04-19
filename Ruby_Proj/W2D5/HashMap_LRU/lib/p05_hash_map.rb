require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    hashed_key = key.hash
    bucket_index = hashed_key % num_buckets
    @store[bucket_index].include?(key)
  end

  def set(key, val)
    hashed_key = key.hash
    bucket_index = hashed_key % num_buckets
    if @store[bucket_index].include?(key)
       @store[bucket_index].update(key,val)
    else
      @store[bucket_index].append(key,val) 
      @count+=1
    end
    if num_buckets == @count
      resize!
    end
    true
  end

  def get(key)
    hashed_key = key.hash
    bucket_index = hashed_key % num_buckets
    return nil if !@store[bucket_index].include?(key)
    @store[bucket_index].get(key)
  end

  # def get_node(key)
  #   hashed_key = key.hash
  #   bucket_index = hashed_key % num_buckets
  #   return nil if !@store[bucket_index].include?(key)
  #   @store[bucket_index].get(key)
  # end

  def delete(key)
    hashed_key = key.hash
    bucket_index = hashed_key % num_buckets
    return nil if !@store[bucket_index].include?(key)
    @count -=1
    @store[bucket_index].remove(key)
  end

  def each
    @store.each do |ll|
      if !ll.empty?
        ll.each do |node|
          yield(node.key, node.val)
        end
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets*2) { LinkedList.new }
    modul = num_buckets*2
    @store.each do |ll|
      if !ll.empty?
        ll.each do |node|
          hashed_key = node.key.hash
          index = hashed_key % modul
          new_arr[index].append(node.key, node.val)
        end
      end
    end
    @store = new_arr
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
