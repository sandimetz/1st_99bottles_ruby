class Bottles
  def verse(number)
    if number == 99
      n = 99
    else
      n = 3
    end

    "#{n} bottles of beer on the wall, " +
    "#{n} bottles of beer.\n" +
    "Take one down and pass it around, " +
    "#{n - 1} bottles of beer on the wall.\n"
  end
end
