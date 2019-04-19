require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
    # (1..max).each do |el|
    #   get(el)
    # end
  end

  def count
    @map.count
  end

  def get(key)
    gotten_node = @map.get(key)
    if gotten_node == nil
      calc!(key)
    else
      update_node!(gotten_node.val)
    end
    return gotten_node
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    if count == @max
      eject!
    end
    # @map.set(key, @prc.call(key))
    new_node = @store.append(key, @prc.call(key))
    @map.set(key, new_node)
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    ##### IF NODE PASSED IN IS FROM MAP ######
    # @store.remove(node.val.key)
    # @store.append(node.val.key, node.val.key.val)


    @store.remove(node.key)
    @store.append(node.key, node.val)
  end

  def eject!
    deleted_node = @store.remove(@store.first.key)
    @map.delete(deleted_node.key)
  end
end
