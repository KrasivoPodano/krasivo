class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :email
      t.boolean :events
      t.boolean :articles

      t.timestamps
    end
  end
end
