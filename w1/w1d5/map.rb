class Map
  def initialize
    @map = []
  end

  def assign(key, val)
    @map.each_with_index do |pair, idx|
      if key == pair.first
        return @map[idx] = [key, val]
      end
    end
    @map << [key, val]
  end

  def lookup(key)
    @map.each do |pair|
      return pair if pair.first == key
    end
    nil
  end

  def remove(key)
    search_idx = nil
    @map.each_with_index do |pair, idx|
      if pair.first == key
        search_idx = idx
        break
      end
    end
    @map.delete_at(search_idx) if search_idx
  end

  def show
    @map
  end
end
