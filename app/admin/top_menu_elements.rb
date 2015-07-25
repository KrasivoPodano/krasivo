ActiveAdmin.register TopMenuElement do
  config.batch_actions = false
  config.clear_sidebar_sections!
  menu :parent => I18n.t('menu'), :label => I18n.t('top_menu')
  config.sort_order = "position_asc"

   index do
     column :row
     column :position
     column :title
     column :link

     default_actions
   end

   form do |f|
     f.inputs t('properties') do
       f.input :row, :as => :select, :collection => [1,2], :include_blank => false
       f.input :position
       f.input :title
       f.input :link
     end
     f.actions
   end

  show do
    attributes_table do
      row :row
      row :position
      row :title
      row :link
    end
   end
end
