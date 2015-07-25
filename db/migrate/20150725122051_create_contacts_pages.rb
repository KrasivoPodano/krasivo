class CreateContactsPages < ActiveRecord::Migration
  def change
    create_table :contacts_pages do |t|
      t.text :text
      t.timestamps
    end
    ContactsPage.create
  end
end
