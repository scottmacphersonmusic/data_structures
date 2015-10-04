class Array
  def insertion_sort
    return self if length == 1
    sorted = []
    self[0..length].each do |num|
      sorted.length.downto 0 do |i|
        sorted[i] = num
        if num < sorted[i - 1]
          sorted[i] = (i.zero? ? num : sorted[i - 1])
        else
          sorted[i] = num
          break
        end
      end
    end
    sorted
  end
end
