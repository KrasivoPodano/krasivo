class AddPublishedToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :published, :boolean, :default => false
  end
end
