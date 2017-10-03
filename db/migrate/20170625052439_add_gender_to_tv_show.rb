class AddGenderToTvShow < ActiveRecord::Migration[5.0]
  def change
    add_reference :tv_shows, :gender, foreign_key: true
  end
end
