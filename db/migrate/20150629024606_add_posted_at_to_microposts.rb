class AddPostedAtToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :posted_at, :datetime
  end
end
