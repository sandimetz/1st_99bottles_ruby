class Bottles
      def song
        verses(99, 0)
      end

      def verses(upper, lower)
        upper.downto(lower).map { |i| verse(i) }.join("\n")
      end

      def verse(number)
        case number
        when 0
          "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
        when 1
          "#{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.\nTake #{pronoun(number)} down and pass it around, #{quantity(number-1)} bottles of beer on the wall.\n"
        else
          "#{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.\nTake #{pronoun(number)} down and pass it around, #{number-1} #{container(number-1)} of beer on the wall.\n"
        end
      end

      def quantity(number)
        if number == 0
          "no more"
        else
          number.to_s
        end
      end

      def container(number)
        if number == 1
          "bottle"
         else
          "bottles"
         end
      end

      def pronoun(number)
        if number == 1
          "it"
        else
          "one"
        end
      end

    end
