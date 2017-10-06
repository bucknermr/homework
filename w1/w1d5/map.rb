class Map
  def initialize
    @map = []
  end

  def assign(key, val)
    new_pair = [key, val]
    search_index = @map.index { |pair| pair.first == key }
    search_index ? @map[search_index] = new_pair : @map << new_pair
    new_pair
  end

  def lookup(key)
    @map.each { |pair| return pair.last if pair.first == key }
    nil
  end

  def remove(key)
    @map.reject! { |pair| pair.first == key }
  end

  def show
    deep_dup(@map)
  end

  private

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end

end
