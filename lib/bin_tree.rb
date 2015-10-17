class NilBinTree
  def method_missing(name); []; end
end

class BinTree
  attr_reader :val, :left, :right

  def initialize(val, left=NilBinTree.new, right=NilBinTree.new)
    @val = val
    @left = left
    @right = right
  end

  def pre_order
    result = []
    result << @val
    @left.pre_order.each { |val| result << val }
    @right.pre_order.each { |val| result << val }
    result
  end

  def in_order
    result = []
    @left.in_order.each { |val| result << val }
    result << @val
    @right.in_order.each { |val| result << val }
    result
  end

  def post_order
    result = []
    @left.post_order.each { |val| result << val }
    @right.post_order.each { |val| result << val }
    result << @val
  end
end
