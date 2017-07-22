require_relative 'card'
require_relative 'deck'
require_relative 'player'

money = 100
while money > 0
      $d = Deck.new
      $d.shuffle!
      puts "You have #{money} in your wallet."
      puts "A new deck has been shuffled and there are #{$d.cards_left} cards"
      puts "Please place your bet."
      bet = gets.chomp
      puts bet
      playah = Player.new
      puts "Player's hand:"
      puts playah.to_s
      dealah = Player.new

      if playah.hand_value == 21
        puts "Player wins with BlackJack!"
        puts "Dealer's hand:"
        puts dealah.to_s

      else
        until playah.hand_value > 21
          playah.switch_ace
          puts "Do you want to hit(h) or stay(s)?"
          action = $stdin.gets.chomp
          if action == "h"
            puts "You chose to hit, here's your new hand"
            playah.hit
            puts playah.to_s
          else
            puts "You chose to stay, here's your final hand"
            puts playah.to_s
            break
          end
        end

        puts "Dealer's hand:"
        puts dealah.to_s

        if playah.hand_value <= 21
          if playah.hand_value > dealah.hand_value
            puts "Player wins"
            money += Integer(bet)
          elsif playah.hand_value == dealah.hand_value
            puts "Dealer and Player tied"
          else
            puts "Dealer wins"
            money -= Integer(bet)
          end
        else
          puts "Player busts. Dealer wins"
          money -= Integer(bet)
        end
      end

      puts "There are #{$d.cards_left} cards in the deck"

puts "Your remaining money is: #{money}."

end
if money <= 0
  puts "game is over, you have no more money"
end
