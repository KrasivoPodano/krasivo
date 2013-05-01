ActiveAdmin.register FrontImage do
  belongs_to :event
  navigation_menu :event
end
