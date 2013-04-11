class Dog
  @@MSGS = {:dance => 'is dancing', :poo => 'is a smelly doggy!', :laugh => 'finds this hilarious!'}

  def initialize name
    @dogType = name
    @actions = []
    @defined_action = {}
  end
  
  def can *actions, &block
    if block_given?
      @defined_action[actions[0]] = block 
      puts "#{@dogType} defined actions is #{@defined_action}"
    else
      @actions.concat actions
      puts "#{@dogType} is #{@actions}"
    end
  end

  def name
    @dogType
  end
  
  def method_missing(name, *args) 
    puts "#{@dogType} wants to #{name} with actions #{@defined_action}"
    if(@actions.include?(name))
      "#{@dogType} #{@@MSGS[:"#{name}"]}"
    elsif @defined_action.key? name
      self.instance_eval(puts @defined_action[name].call)
    else
    "#{@dogType} doesn't understand #{name}"
    end
  end
end 
