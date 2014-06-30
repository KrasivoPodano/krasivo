# coding: utf-8

ActiveAdmin.register Course do
  
  
  config.batch_actions = false
  filter :published, as: :select, collection: [['Да', 'true'], ['Нет', 'false']]
  
  
  
  index do 
    column :title do |column|
      column.title
    end
    bool_column :published
    column :text do |column|
      if column.text
        text = strip_tags(column.text).gsub(/&quot;/i,"").gsub(/&nbsp;/i,"")
        truncate(text, length: 100, omission: '...').html_safe
      end
    end
    
  end
  


end
