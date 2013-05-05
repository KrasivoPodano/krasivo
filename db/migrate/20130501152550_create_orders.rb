class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :company
      t.string :phone1
      t.string :phone2
      t.string :phone3
      t.string :mail
      t.text :comment

      t.timestamps
    end
  end
end
