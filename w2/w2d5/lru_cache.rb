

class LRUCache
  def initialize(max_cache_size)
    @max_cache_size = max_cache_size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    @cache.delete(el)
    @cache << el
    @cache.shift if count > @max_cache_size
    # delete_lru if count > @max_cache_size
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache
    nil
  end

  private
  # helper methods go here!
end
