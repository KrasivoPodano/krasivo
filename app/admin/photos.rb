ActiveAdmin.register Photo do
  belongs_to :album
  navigation_menu :album
end
