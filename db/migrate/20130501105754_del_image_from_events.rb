class DelImageFromEvents < ActiveRecord::Migration
  def change
    remove_attachment :events, :image
  end
end
