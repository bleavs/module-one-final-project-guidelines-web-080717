class Character < ActiveRecord::Base

  has_many :character_episodes
  has_many :episodes, through: :character_episodes

  # def self.find_or_create_by
  #   character_hash.each do |char|
  #     character.find_or_create(name: char["name"], house: char["house"])
  #   end

  def self.most_episodes
    most_char = nil
    most_char_eps = 0
    Character.all.each do |char|
      if char.episodes.count > most_char_eps
        most_char_eps = char.episodes.count
        most_char = char.name
      end
    end
    puts most_char
  end


end
