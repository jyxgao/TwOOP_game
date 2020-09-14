require_relative './player'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
    @round = 1
  end

  def next_round
    num1 = rand(1..20)
    num2 = rand(1..20)
    @answer = (num1 + num2).to_i
    @players.rotate!
    @round += 1
    
    puts "----- NEW TURN -----"
    puts "#{@players[0].name}: What does #{num1} plus #{num2} equal?"
    
  end

  def check_answer
    print "> "
    sum = $stdin.gets.chomp.to_i

    if sum == @answer
      puts "YES! You are correct."
    else 
      @players[0].take_life
      puts "Seriously? No!"
    end
  end

  def display_status
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def game_over?
    @players.select {|player| player.dead? }.count > 0
  end

  def play
    puts "Game starting"

      next_round
      check_answer
      display_status
  end
end