ActiveAdmin.register Order do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  index do 
    column :id
    column :name
    column :phone1
    column :mail
    # column :people
    # column :date
    # column :time do |column|
    #   column.time.strftime('%H:%M') if column.time.present?
    # end
    # column :event_type
    
    default_actions
  end
  
  form do |f|  
    f.inputs t('properties') do
      f.input :name
      f.input :phone1
      f.input :phone2
      f.input :phone3
      f.input :mail
    end
    f.actions
  end
  
  
  
  show do 
    attributes_table do
      row :id
      row :name
      row :phone1
      row :phone2
      row :phone3
      row :mail
      row :comment
      # row :people
      # row :date
      # row :time do |row|
      #   row.time.strftime('%H:%M') if row.time.present?
      # end
      # 
      # row :beautiful_cake
      # row :ornament
      # row :children_cake
      # row :animators
      # row :money
      # row :event_type
    end
  end

end
