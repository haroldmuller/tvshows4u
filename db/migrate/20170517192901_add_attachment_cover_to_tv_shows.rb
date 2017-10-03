class AddAttachmentCoverToTvShows < ActiveRecord::Migration
  def self.up
    change_table :tv_shows do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :tv_shows, :cover
  end
end
