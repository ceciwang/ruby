class Parser
  def initialize ds
    @tws = Hash[ds]
  end
  
  def method_missing(name, *args)
    @tws["#{name}"]
  end
end

obj = Parser.new [['developer', 'DEV'], ['QAQAQA','QA']]
puts obj.developer
