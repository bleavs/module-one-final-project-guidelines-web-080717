class CreateEpisodes < ActiveRecord::Migration[4.2]

  def change
    create_table :episodes do |t|
      t.string :name
      t.integer :season
      t.integer :episode_in_season  # nr in episodeschema
  end
end

end
