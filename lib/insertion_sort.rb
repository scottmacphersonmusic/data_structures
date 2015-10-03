class Array
  def insertion_sort
    return self if self.length == 1
    sorted = []
    self[0..(self.length)].each do |num|
      sorted.length.downto 0 do |i|
        sorted[i] = num
        if i == 0
          sorted[i] = num
        elsif num < sorted[i - 1]
          sorted[i] = sorted[i-1]
        else
          sorted[i] = num
          break
        end
      end
    end
    sorted
  end
end
