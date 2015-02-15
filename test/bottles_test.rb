# ...
  # ...
    # ...
      # ...
gem 'minitest', '~>5'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/bottles'

class BottlesTest < Minitest::Test
  def test_the_first_verse
    expected = <<-VERSE
99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.
VERSE
    assert_equal expected, ::Bottles.new.verse(99)
  end

  def test_another_verse
    expected = <<-VERSE
3 bottles of beer on the wall, 3 bottles of beer.
Take one down and pass it around, 2 bottles of beer on the wall.
VERSE
    assert_equal expected, ::Bottles.new.verse(3)
  end

  def test_verse_2
    expected = <<-VERSE
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
    VERSE
    assert_equal expected, ::Bottles.new.verse(2)
  end

  def test_verse_1
    expected = <<-VERSE
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
    VERSE
    assert_equal expected, ::Bottles.new.verse(1)
  end
end
