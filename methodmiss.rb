class Computer
  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__|method_missing|respond_to?/
  end

  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing (name, *args)
    super if !respond_to? (name)
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_source", @id
      ...
  end

  def respond_to?(name)
    @data_source.respond_to?("get_#{method}_info") || super
  end
end
