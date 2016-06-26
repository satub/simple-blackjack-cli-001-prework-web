def welcome
  # code #welcome here
  puts "Welcome to the Blackjack Table"
end

def deal_card
  # code #deal_card here
  card = rand(1..11)
end

def display_card_total(card_total)
  # code #display_card_total here
  puts "Your cards add up to #{card_total}"
  card_total
end

def display_dealer_total(dealer_total)
  # code #display_card_total here
  puts "Dealer's cards add up to #{dealer_total}"
  dealer_total
end

def prompt_user
  # code #prompt_user here
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  # code #get_user_input here
  user_input = gets.chomp
end

def end_game1(dealer_total, card_total)
  # code #end_game here
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
  card_total
end

def end_game2(dealer_total, card_total)
  puts "Sorry, dealer wins #{dealer_total} over #{card_total}. Thanks for playing!"
end

def end_game3(dealer_total, card_total)
  puts "You win! Dealer hit #{dealer_total}. Thanks for playing!"
end

def end_game4(dealer_total, card_total)
  puts "You win! #{card_total} over #{dealer_total}. Thanks for playing!"
end

def end_game5(dealer_total, card_total)
  puts "It's a tie! You:#{card_total} Dealer: #{dealer_total}"
end

def initial_round
  # code #initial_round here
  card_total = 0
  card_total += deal_card
  card_total += deal_card
  display_card_total(card_total)
  card_total
end

def initial_round_dealer
  # code #initial_round here
  dealer_total = 0
  dealer_total += deal_card
  dealer_total += deal_card
  display_dealer_total(dealer_total)
  dealer_total
end

def hit?(card_total)
  # code hit? here
  prompt_user
  input = get_user_input
  if input.downcase == "h"
    card_total += deal_card
  elsif input.downcase == "s"
    #Stay put and do nothing
  else
    invalid_command
  end
  card_total
end

def dealer_hits?(dealer_total)
  if dealer_total >= 21
    #do nothing
  else
    dealer_total += deal_card
  end
  dealer_total
end

def invalid_command
  # code invalid_command here
  puts "Please enter a valid command."
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner2
  game_on = true
  welcome
  card_total = 0
  dealer_total = 0
  dealer_total = initial_round_dealer
  card_total = initial_round
  while game_on do
    if card_total == 21 && dealer_total != 21
      end_game4(dealer_total, card_total)
      game_on = false
    elsif card_total != 21 && dealer_total == 21
      end_game2(dealer_total, card_total)
      game_on = false
    elsif card_total > 21 && dealer_total <= 21
      end_game1(dealer_total, card_total)
      game_on = false
    elsif card_total <= 21 && dealer_total > 21
      end_game3(dealer_total, card_total)
      game_on = false
    elsif card_total == 21 && dealer_total == 21
      end_game5(dealer_total, card_total)
      game_on = false
    else
      dealer_total = dealer_hits?(dealer_total)
      card_total = hit?(card_total)
      display_dealer_total(dealer_total)
      display_card_total(card_total)
    end
  end
end
