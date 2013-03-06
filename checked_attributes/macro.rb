require 'test/unit'

class Person
  attr_checked :age do |v|
    v >= 18
  end
end

class PersonTest < Test::Unit::TestCase
  def setup
    @bob = Person.new
  end

  def test_accept_valid_age
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_raise_invalid_age
    assert_raise RuntimeError 'Invalid Attribute' do
      @bob.age = 17
    end
  end
end

class Class
  def attr_checked (attribute, &validate)
    define_method("#{attribute}=") do |value|
      raise 'Invalid Attribute' unless validate.call(value)
      instance_variable_set("@#{attribute}")
    end
  end
end
