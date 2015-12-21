class Bottles
  def verse(number)
    "#{number} bottles of beer on the wall, " +
    "#{number} bottles of beer.\n" +
    "Take one down and pass it around, " +
    "#{number-1} bottle#{'s' unless (number-1) == 1} of beer " +
      "on the wall.\n"
  end
end
