class AddCourseIdToFrontImages < ActiveRecord::Migration
  def change
    add_column :front_images, :course_id, :integer
  end
end
