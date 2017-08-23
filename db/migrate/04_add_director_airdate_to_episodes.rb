class AddDirectorAirdateToEpisodes < ActiveRecord::Migration[4.2]

  def change
    add_column :episodes, :director, :string
    add_column :episodes, :airdate, :date
  end

end
