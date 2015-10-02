class Task
  attr_accessor :val,:nxt

  def initialize(val, nxt = nil)
    @val = val
    @nxt = nxt
  end
end
