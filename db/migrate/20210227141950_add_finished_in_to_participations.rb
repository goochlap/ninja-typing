class AddFinishedInToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_column :participations, :finished_in, :string
  end
end
