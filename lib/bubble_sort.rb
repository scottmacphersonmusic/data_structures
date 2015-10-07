class Array
  def bubble_sort!
    return self if length == 1
    loop do
      swapped = false

      (length-1).times do |i|
        if self[i] > self[i+1]
          self[i], self[i+1] = self[i+1], self[i]
          swapped = true
        end

      end
      break if not swapped
    end
    self
  end
end

# monkey-patched version of algorithm at http://www.sitepoint.com/sorting-algorithms-ruby/
