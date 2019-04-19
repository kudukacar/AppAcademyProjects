class MaxIntSet
  attr_reader :max, :store

  def initialize(max)
    @max = max
    @store = Array.new(max) {false}
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    is_valid?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise "number out of bounds" if num >= max || num < 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    bucket_location = num  % num_buckets
    @store[bucket_location] << num
    true

  end

  def remove(num)
    return false if !include?(num)
    bucket_location = num  % num_buckets
    @store[bucket_location].delete(num)
    true
  end

  def include?(num)
    bucket_location = num  % num_buckets
    @store[bucket_location].each do |ele|
      return true if num == ele
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    bucket_location = num % num_buckets
    @store[bucket_location] << num
    @count += 1
    resize! if @count == num_buckets
    true
  end

  def remove(num)
    return false if !include?(num)
    bucket_location = num  % num_buckets
    @store[bucket_location].delete(num)
    @count -= 1
    true
  end

  def include?(num)
    return false if count == 0
    bucket_location = num  % num_buckets
    @store[bucket_location].each do |ele|
      return true if num == ele
    end
    false
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
    new_mod = num_buckets*2
    @store.each do |bucket|
      bucket.each do |ele|
        arr[ele % new_mod] << ele
      end
    end
    @store = arr
  end
end
