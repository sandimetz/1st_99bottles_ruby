require_relative '../../test_helper'
require_relative '../lib/bottles'

class BottleVerseTest < Minitest::Test
  def test_the_first_verse
    expected = "99 bottles of beer on the wall, " +
      "99 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "98 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(99)
  end

  def test_another_verse
    expected = "3 bottles of beer on the wall, " +
      "3 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "2 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(3)
  end

  def test_verse_2
    expected = "2 bottles of beer on the wall, " +
      "2 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "1 bottle of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(2)
  end

  def test_verse_1
    expected = "1 bottle of beer on the wall, " +
      "1 bottle of beer.\n" +
      "Take it down and pass it around, " +
      "no more bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(1)
  end

  def test_verse_0
    expected = "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(0)
  end
end

class FakeVerse
  def self.lyrics(number)
    "This is verse #{number}.\n"
  end
end

class CountdownSongTest < Minitest::Test
  def test_verse
    assert_equal "This is verse 47.\n",
      CountdownSong.new(verse_template: FakeVerse).verse(47)
  end

  def test_a_couple_verses
    expected =
      "This is verse 99.\n" +
      "\n" +
      "This is verse 98.\n"
    assert_equal expected,
      CountdownSong.new(verse_template: FakeVerse).verses(99, 98)
  end

  def test_the_whole_song
    expected =
      "This is verse 47.\n" +
      "\n" +
      "This is verse 46.\n" +
      "\n" +
      "This is verse 45.\n" +
      "\n" +
      "This is verse 44.\n" +
      "\n" +
      "This is verse 43.\n"
    assert_equal expected,
      CountdownSong.new(verse_template: FakeVerse, max: 47, min: 43).song
  end
end
