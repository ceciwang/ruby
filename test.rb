class Test
  def initialize (value)
    @name = value
  end
end

class Test2 < Test

end

obj = Test2.new "value"


