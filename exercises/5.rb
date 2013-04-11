=begin
class MaskedString < String
  def tr_vowel
    tr 'aeiou', '*'
  end
  def self.tr_vowel str
    str.tr 'aeiou', '*'
  end
end
=end

module Vowel
  define_method(:tr_vowel) do
    tr 'aeiou', '*'
  end

  def self.included(base)
    base.extend(ClassMethod)
  end

  module ClassMethod
    define_method(:tr_vowel) do |str|
      str.tr 'aeiou', '*'
    end
  end
end

MaskedString = Class.new do
  include Vowel
end

obj = MaskedString.new



