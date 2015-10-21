class Array
  def merge_sort
    return self if length == 1
    mid = length / 2
    self[0..(mid - 1)].merge_sort.merge self[mid..-1].merge_sort
  end

  def merge(arr)
    merged = []
    until length == 0 || arr.length == 0
      merged << (first <= arr.first ? shift : arr.shift)
    end
    merged + self + arr
  end
end
