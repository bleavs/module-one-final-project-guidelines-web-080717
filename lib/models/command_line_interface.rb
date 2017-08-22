class CommandLineInterface

# def Welcome ##
#
# puts ___ # welcome message
#
# -- number commands
#
# --- gets.chomp ##
#
# ---

  def greet
    puts "Welcome to the GameOfThrones database, your spot for searching for character's and there episode appearances."

  end

  def gets_user_input
    puts "If you would like to find a specific character's episode appearances please press (1). If you would like to know the character who appears in the most episodes please press (2). If you would like to know the episode that features the greatest number of characters please press (3)"
    input = gets.chomp
  end

  def find_character_episodes
    puts "Please enter the name of a character"
    character_name = gets.chomp
    if Character.all.find_by(name: character_name)
      episodess =  Character.all.find_by(name: character_name).episodes
      episode_names = episodess.each{|episode| puts "Episode Name: #{episode.name}, Episode Season: #{episode.season}, Episode In Season: #{episode.episode_in_season}"}
    else
    try_again
    end
  end

  def try_again
    puts "The input of the name of the character you searched is not in our database or you pressed an incorrect number. Please try again."
    go_again
  end

  def go_again
    puts "If you would like to continue searching please (y), otherwise press (n)"
    answer = gets.chomp
    if answer == "y"
      run
    elsif answer == "n"
     puts "WHAT IS DEAD MAY NEVER DIE!"
    else
     go_again
   end
 end

  def run
    greet

    input = gets_user_input

    if input == "1"
      find_character_episodes
      go_again

    elsif input == "2"
      Character.most_episodes
      go_again

    elsif input == "3"
      Episode.most_characters
      go_again

    else
      try_again
    end
  end

  end
