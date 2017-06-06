require './questions.rb'
require './players.rb'

class Game

    def initialize
      puts 'Welcome to the Hunger for Math Games'
      sleep(1)
      puts 'Please enter your name, Tribute One:'
      name1 = gets.chomp
      @player1 = Players.new(gets.chomp)
      puts 'Please enter your name, Tribute Two:'
      name2 = gets.chomp
      @player2 = Players.new(gets.chomp)
      sleep(1)
      puts "Okay, #{@player1.name} and #{@player2.name}...."
      puts 'Let the games begin...'
    end

    def question
      question = Question.new
      @query = question.question
      @ans = question.answer
      sleep(1)
      puts ' -- NEW CHALLENGE -- '
      if @player1.turn
        sleep(1)
        puts "  - #{@player1.name} -"
        puts "#{@query}"
      else
        sleep(1)
        puts "    - #{@player2.name} - "
        puts "#{@query}"
      end
    end

#check answer
    def check_answer
      if STDIN.gets.chomp.to_i == @ans
        if @player1.turn
          @player1.life += 1
          puts 'You are correct!  You get to keep a life, for now...'
          @player1.turn = false
          @player2.turn = true
          life
          win?
        else
          @player2.life += 1
          puts 'You are correct!  You get to keep a life, for now...'
          @player1.turn = true
          @player2.turn = false
          life
          win?
        end
      else
        if @player1.turn
          puts "#{@player1.name}: WRONG!  One less life for you, tribute."
          @player1.turn = false
          @player2.turn = true
          sleep(1)
          puts "The corrent answer was #{@ans}."
          life
          win?
        else
          puts "#{@player2.name}: WRONG!  One less life for you, tribute."
          @player1.turn = true
          @player2.turn = false
          sleep(1)
          puts "The corrent answer was #{@ans}."
          life
          win?
        end
      end
    end


    def life
      sleep(1)
      puts "  Current score, tributes: "
      puts "#{@player1.name}: #{@player1.life.to_s}/3 -- #{@player2.name}: #{@player2.life.to_s}/3}"
    end

    def turn
      question
      check_answer
    end

    def game_over?
      @life <= 0
    end

    def win?
      if @player1.life == 3
        sleep(1)
        puts ' - You have fallen, tribute -'
        sleep(1)
        puts "#{@player1.name} wins!"
        sleep(1)
        puts 'Congrats!  You have survived the Hunger for Math Games!'
      elsif @player2.life == 3
        puts ' - You have fallen, tribute -'
        sleep(1)
        puts "#{@player1.name} wins!"
        sleep(1)
        puts 'Congrats!  You have survived the Hunger for Math Games!'
      else
        turn
      end
    end

end #end of class

