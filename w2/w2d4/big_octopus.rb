def sluggish_octopus(fish)

  fish.each_with_index do |f1, i|
    max_length = true

    fish.each_with_index do |f2, j|
      next if i == j
      max_length = false if f1.length < f2.length
    end

    return f1 if max_length
  end
end

class Array
  def quick_sort_by_length(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    return self if length <= 1

    pivot = self.first
    left = []
    right = []

    self[1..-1].each do |el|
      if prc.call(pivot.length, el.length) >= 1
        left << el
      else
        right << el
      end
    end

    left.quick_sort_by_length + [pivot] + right.quick_sort_by_length
  end
end

def dominant_octopus(fish)
  fish.quick_sort_by_length.last
end


def clever_octopus(fish)
  max_length = fish.first

  fish[1..-1].inject(max_length) do |max, el|
    el.length > max.length ? el : max
  end

end



def slow_dance(dir, tiles_arr)
  tiles_arr.each_with_index do |tile, idx|
    return idx if dir == tile
  end
end

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end

TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

TILES_HASH = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}
p slow_dance('up', TILES_ARRAY)
p fast_dance('left-up', TILES_HASH)
