animal = 'dog'
=begin
def animal.speak
  'Dog says Woof!'
end
class << animal
  def speak
    'Dog says Woof!'
  end
end
animal.instance_eval do
  def speak
    'Dog says Woof!'
  end
end
class << animal
  define_method(:speak) do
    'Dog says Woof!'
  end
end
module Shout 
  def speak
    'Dog says Woof!'
  end
end
animal.extend(Shout)
module Shout
  def speak
    'Dog says Woof!'
  end
end
class << animal
  include Shout
end
=end

puts animal.speak
