def event(name, &block) 
  @events[name] = block
end

def setup &block 
  @setups.push block
end

Dir.glob('*events.rb') do |file|
  @events = {}
  @setups = []
  load file
  @events.each_pair do |name, event|
    env = Object.new 
    @setups.each do |setup|
      env.instance_eval &setup
    end 
    puts "Alert: #{name}" if env.instance_eval &event
  end
end




