class AddFieldsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :html_title, :string
    add_column :pages, :seo_url, :string
    add_column :pages, :slug, :string
    add_index :pages, :slug, unique: true
  end
end
