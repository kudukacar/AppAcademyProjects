class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    str = self.to_s
    str.hash
  end
end

class String
  def hash
    return_hash = ""
    self.each_char do |char|
      return_hash += char.ord.to_s
    end
    return_hash.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    key_hash=0
    val_hash=0
    self.each do |k,v|
      key_hash += k.to_s.ord
      val_hash += v.to_s.ord
    end
    key_hash *= 13
    val_hash *= 23
    key_hash + val_hash
  end
end
