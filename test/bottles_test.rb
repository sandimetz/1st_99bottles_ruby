gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/bottles'

class BottleVerseTest < Minitest::Test
  def test_the_first_verse
    expected = <<~VERSE
      99 bottles of beer on the wall, 99 bottles of beer.
      Take one down and pass it around, 98 bottles of beer on the wall.
    VERSE
    assert_equal expected, BottleVerse.lyrics(99)
  end

  def test_another_verse
    expected = <<~VERSE
      3 bottles of beer on the wall, 3 bottles of beer.
      Take one down and pass it around, 2 bottles of beer on the wall.
    VERSE
    assert_equal expected, BottleVerse.lyrics(3)
  end

  def test_verse_2
    expected = <<~VERSE
      2 bottles of beer on the wall, 2 bottles of beer.
      Take one down and pass it around, 1 bottle of beer on the wall.
    VERSE
    assert_equal expected, BottleVerse.lyrics(2)
  end

  def test_verse_1
    expected = <<~VERSE
      1 bottle of beer on the wall, 1 bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.
    VERSE
    assert_equal expected, BottleVerse.lyrics(1)
  end

  def test_verse_0
    expected = <<~VERSE
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
    assert_equal expected, BottleVerse.lyrics(0)
  end
end

class FakeVerse
  def self.lyrics(number)
    new(number).lyrics
  end

  attr_reader :number
  def initialize(number)
    @number = number
  end

  def lyrics
    "This is verse #{number}.\n"
  end
end

class CountDownSongTest < Minitest::Test
  def test_a_verse
    expected = "This is verse 99.\n"
    assert_equal(
      expected,
      CountDownSong.new(verse_template: FakeVerse).verse(99))
  end

  def test_a_couple_verses
    expected = <<~VERSES
      This is verse 99.

      This is verse 98.
    VERSES
    assert_equal(
      expected,
      CountDownSong.new(verse_template: FakeVerse).verses(99, 98))
  end

  def test_the_whole_song
    expected = <<~VERSES
      This is verse 47.

      This is verse 46.

      This is verse 45.

      This is verse 44.

      This is verse 43.
    VERSES
    assert_equal(
      expected,
      CountDownSong.new(
        verse_template: FakeVerse, max: 47, min: 43).
          song)
  end
end
