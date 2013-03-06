require 'test/unit'
load 'openclass.rb'

class StringExtensionsTest < Test::Unit::TestCase
  def test_strings_non_alpha_chars
    assert_equal '3 the Magic number', '#3, the *Magic number*?'.to_alphanumeric
  end
end
