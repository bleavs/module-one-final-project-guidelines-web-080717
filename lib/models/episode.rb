class Episode < ActiveRecord::Base

  has_many :character_episodes
  has_many :characters, through: :character_episodes


    def self.most_characters
      most_char_ep = nil
      most_chars_num = 0
      Episode.all.each do |episode|
        if episode.characters.count > most_chars_num
          most_chars_num = episode.characters.count
          most_char_ep = episode.name
        end
      end
      puts most_char_ep
    end



end
