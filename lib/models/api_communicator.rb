

require 'rest-client'
require 'JSON'
require 'pry'
require_relative './character'
require_relative './episode'
require_relative './character_episode'


class ApiCommunicator < ActiveRecord::Base

  def self.get_characters

  all_characters =
  RestClient.get('https://api.got.show/api/characters/')

  character_hash = JSON.parse(all_characters)

  character_hash.each do |char|
     Character.find_or_create_by(name: char["name"], house: char["house"])
   end


  end

def self.get_episodes


  all_episodes =
  RestClient.get('https://api.got.show/api/episodes/')

  episode_hash = JSON.parse(all_episodes)

  episode_hash.each do |episode|
    Episode.find_or_create_by(name: episode["name"], season: episode["season"], episode_in_season: episode["nr"])
  end

end

def self.get_char_episodes

  all_characters =
  RestClient.get('https://api.got.show/api/characters/')

  character_hash = JSON.parse(all_characters)

  all_episodes =
  RestClient.get('https://api.got.show/api/episodes/')

  episode_hash = JSON.parse(all_episodes)


  episode_hash.each do |episode| #for each episode

    epcharacters = episode["characters"]

    epcharacters.each do |char|
      CharacterEpisode.find_or_create_by(character_id: (Character.find_by(name: char).id), episode_id: Episode.find_by(name: episode["name"]).id)
    end
  end
end



end
