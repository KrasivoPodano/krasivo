class AddTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :property, :string
  end
end
