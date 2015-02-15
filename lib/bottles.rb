# ...
  # ...
    # ...
      # ...
class Bottles
  # FIXME: no test coverage for 4..98
  def verse(number)
    "#{number} bottles of beer on the wall, " +
    "#{number} bottles of beer.\n" +
    "Take one down and pass it around, " +
    "#{number-1} #{(number-1) == 1 ? 'bottle' : 'bottles'} of beer " +
      "on the wall.\n"
  end
end
