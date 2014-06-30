class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :text
      t.boolean :main
      t.text :shorttext
      t.text :eventdetails
      t.integer :price
      t.boolean :published, :default => false
      t.string :property
      t.string :seo_url
      t.string :html_title
      t.text :meta_description
      t.string :slug
      t.boolean :filled, :default => false
      t.boolean :want_more, :default => false
      t.string :duration

      t.timestamps
    end
  end
end
