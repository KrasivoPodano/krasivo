class AddSeoFields < ActiveRecord::Migration
  def change
    add_column :articles, :seo_url, :string
    add_column :articles, :html_title, :string
    add_column :articles, :meta_description, :text
    add_column :articles, :slug, :string
    add_index :articles, :slug, unique: true
    add_column :vacancies, :seo_url, :string
    add_column :vacancies, :html_title, :string
    add_column :vacancies, :meta_description, :text
    add_column :vacancies, :slug, :string
    add_index :vacancies, :slug, unique: true
    add_column :events, :seo_url, :string
    add_column :events, :html_title, :string
    add_column :events, :meta_description, :text
    add_column :events, :slug, :string
    add_index :events, :slug, unique: true
    add_column :recipes, :seo_url, :string
    add_column :recipes, :html_title, :string
    add_column :recipes, :meta_description, :text
    add_column :recipes, :slug, :string
    add_index :recipes, :slug, unique: true
  end
end
