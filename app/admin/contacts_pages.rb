# coding: utf-8

ActiveAdmin.register ContactsPage do
  config.batch_actions = false
  config.clear_sidebar_sections!
  actions :index, :show, :update, :edit
  menu label: 'Контакты'

  index do
    column :text do |column|
      column.text.html_safe
    end
    default_actions
  end

  form do |f|
    f.inputs t('properties') do
      f.input :text, input_html: { class: "redactor" }, :label => false
    end

    f.actions
  end


  show do
    attributes_table do
      row :text do |row|
        row.text.html_safe
      end
    end
  end
end