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
    @tree.pre_order.must_equal ['Tim', 'Jony', 'Katie', 'Peter',
                                'Andrea', 'Dan', 'Phil', 'Craig', 'Eddie'
                               ]
  end

  it "performs in-order traversal" do
    @tree.in_order.must_equal ['Peter', 'Katie', 'Andrea', 'Jony',
                               'Dan', 'Tim', 'Craig', 'Phil', 'Eddie'
                              ]
  end

  it "performs post-order traversal" do
    @tree.post_order.must_equal ['Peter', 'Andrea', 'Katie', 'Dan',
                                 'Jony', 'Craig', 'Eddie', 'Phil', 'Tim'
                                ]
  end
end
