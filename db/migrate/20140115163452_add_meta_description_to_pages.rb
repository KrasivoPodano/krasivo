class AddMetaDescriptionToPages < ActiveRecord::Migration
  def change
    add_column :pages, :meta_description, :text
  end
end
