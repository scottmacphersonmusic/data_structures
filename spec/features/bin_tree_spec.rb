require 'spec_helper'
require 'bin_tree'

describe BinTree do
  before do
    @tree = BinTree.new('Tim',
                        BinTree.new('Jony',
                                    BinTree.new('Katie',
                                                BinTree.new('Peter'),
                                                BinTree.new('Andrea')
                                               ),
                                    BinTree.new('Dan')
                                   ),
                        BinTree.new('Phil',
                                    BinTree.new('Craig'),
                                    BinTree.new('Eddie')
                                   )
                       )
  end

  it "performs pre-order traversal" do
    result = %w(Tim Jony Katie Peter Andrea Dan Phil Craig Eddie)
    @tree.pre_order.must_equal result
  end

  it "performs in-order traversal" do
    result = %w(Peter Katie Andrea Jony Dan Tim Craig Phil Eddie)
    @tree.in_order.must_equal result
  end

  it "performs post-order traversal" do
    result = %w(Peter Andrea Katie Dan Jony Craig Eddie Phil Tim)
    @tree.post_order.must_equal result
  end
end
