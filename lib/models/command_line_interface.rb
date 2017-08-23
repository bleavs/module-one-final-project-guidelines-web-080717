require 'pry'


class CommandLineInterface


  def greet
    puts "Welcome to the GameOfThrones database, your spot for searching for character's and their episode appearances.".blink.blue
  end

  def gets_user_input
    puts "If you would like to find a specific character's episode appearances please press (1).
          If you would like to know the character who appears in the most episodes please press (2).
          If you would like to know the episode that features the greatest number of characters please press (3).
          If you would like to know the characters in a specific house please press (4).
          If you would like to know the episodes that have appearances from a specific house please press (5)".bold.blue
    input = gets.chomp
  end

  def find_character_episodes

    puts "Please enter the name of a character".bold.blue

    character_name = gets.chomp

    if Character.all.find_by(name: character_name)
      episodess =  Character.all.find_by(name: character_name).episodes
      eps = episodess.order(:season, :episode_in_season)

      episode_names = eps.each{|episode| puts "Episode Name: #{episode.name}, Season: #{episode.season}, Episode: #{episode.episode_in_season}, Director: #{episode.director}, Airdate: #{episode.airdate}"}
      go_again
    else
      try_again
    end
  end

  def find_house_episodes
    puts "Please enter the name of a house".bold.blue
    house_name = gets.chomp

    if Character.where(house: "House #{house_name}")
       char_array =  Character.where(house: "House #{house_name}")

        eps_array = []

        char_array.each do |char|

          eps_array << char.episodes
        end

         all_episodes = eps_array.flatten.uniq


        # all_uniq = all_episodes.order(:season, :episode_in_season).uniq
        sorted = all_episodes.sort_by{|episode| [episode.season, episode.episode_in_season] }
          if sorted.length > 1
        # sortedd = sorted.sort_by(&:season)
            try =  sorted.each {|episode| puts "Episode Name: #{episode.name}, Season: #{episode.season}, Episode: #{episode.episode_in_season}, Director: #{episode.director}, Airdate: #{episode.airdate}"}
            go_again
          else
            puts "That house has not appeared in any episodes!".bold.red
            go_again

          end

        #
        # episode_names = all_uniq.each{|episode| puts "Episode Name: #{episode.name}, Season: #{episode.season}, Episode: #{episode.episode_in_season}, Director: #{episode.director}, Airdate: #{episode.airdate}"}

    else

      try_again
    end
  end

####

  def find_house_characters
    puts "Please enter the name of a house".bold.blue
    house_name = gets.chomp
    if Character.where(house: "House #{house_name}").size > 0
       puts Character.where(house: "House #{house_name}").pluck(:name)
       go_again
     else
       puts "That is not a recognized house!".bold.red
       puts "SHAME...SHAME...SHAME..SHAME...SHAME...SHAME..SHAME...SHAME...SHAME!!!".blink.red
       go_again
     end
   end



  def try_again
    puts "The input of the name of the character you searched is not in our database or you pressed an incorrect number. Please try again.".bold.red
    puts "SHAME...SHAME...SHAME..SHAME...SHAME...SHAME..SHAME...SHAME...SHAME!!!".blink.red
    go_again


  end

  def go_again
    puts "If you would like to continue searching please press (y), otherwise press (n)".bold.blue
    answer = gets.chomp

    if answer == "y"
      run
    elsif answer == "n"
      puts "WHAT IS DEAD MAY NEVER DIE!".blink.red

    else       #answer == "n"
      puts "The input of the name of the character or house you searched is not in our database or you pressed an incorrect number. Please try again.".bold.red

      go_again
    end

 end


  def run

    greet

    input = gets_user_input

    if input == "1"

      find_character_episodes


    elsif input == "2"
      Character.most_episodes
      go_again
    elsif input == "3"
      Episode.most_characters
      go_again

    elsif input == "4"

      find_house_characters


    elsif input == "5"

      find_house_episodes




    elsif input != "1" && input != "2" && input != "3" && input != "4" && input != "5"
      try_again
    end
  end

  end
