class Array
  def merge_sort
    return self if self.length == 1
    mid = self.length / 2
    self[0..(mid - 1)].merge_sort.merge self[mid..-1].merge_sort
  end

  def merge(arr)
    merged = []
    until self.length == 0 || arr.length == 0 do
      if self.first <= arr.first
        merged << self.shift
      else
        merged << arr.shift
      end
    end
    merged + self + arr
  end
end
