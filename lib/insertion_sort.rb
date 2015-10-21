class Array
  def insertion_sort!
    return self if length == 1
    1.upto length - 1 do |i|
      i.downto(1) { |j| self[j] <= self[j - 1] ? swap(j, j - 1) : break }
    end
    self
  end

  def swap(a, b)
    self[a], self[b] = self[b], self[a]
  end
end
