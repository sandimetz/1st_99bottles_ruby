class Bottles

  def song
    verses(99, 0)
  end

  def verses(bottles_at_start, bottles_at_end)
    bottles_at_start.downto(bottles_at_end).map do |bottles|
      verse(bottles)
    end.join("\n")
  end

  def verse(bottles)
    Round.new(bottles).to_s
  end
end

class Round
  attr_reader :bottles
  def initialize(bottles)
    @bottles = bottles
  end

  def to_s
    challenge + response
  end

  def challenge
    bottles_of_beer.capitalize + " " + on_wall + ", " +
    bottles_of_beer + ".\n"
  end

  def response
    go_to_the_store_or_take_one_down + ", " +
    bottles_of_beer + " " + on_wall + ".\n"
  end

  def bottles_of_beer
    "#{anglicized_bottle_count} #{pluralized_bottle_form} of #{beer}"
  end

  def beer
    "beer"
  end

  def on_wall
    "on the wall"
  end

  def pluralized_bottle_form
    last_beer? ? "bottle" : "bottles"
  end

  def anglicized_bottle_count
    all_out? ? "no more" : bottles.to_s
  end

  def go_to_the_store_or_take_one_down
    if all_out?
      @bottles = 99
      buy_new_beer
    else
      lyrics = drink_beer
      @bottles -= 1
      lyrics
    end
  end

  def buy_new_beer
    "Go to the store and buy some more"
  end

  def drink_beer
    "Take #{it_or_one} down and pass it around"
  end

  def it_or_one
    last_beer? ? "it" : "one"
  end

  def all_out?
    bottles.zero?
  end

  def last_beer?
    bottles == 1
  end
end
