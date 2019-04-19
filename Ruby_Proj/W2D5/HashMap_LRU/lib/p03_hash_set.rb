class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    index = key.hash % num_buckets
    @store[index] << key
    @count+=1
    resize! if count == num_buckets
    true
  end

  def include?(key)
    index = key.hash % num_buckets
    @store[index].include?(key)
  end

  def remove(key)
    return false if !include?(key)
    index = key.hash % num_buckets
    @store[index].delete(key)
    @count -=1
    true
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = Array.new(num_buckets*2) { Array.new }
    @store.each do |bucket|
      bucket.each do |key|
        index = key.hash % arr.length
        arr[index] << key
      end
    end
    @store = arr
  end
end
