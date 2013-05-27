ActiveAdmin.register Appointment do
  config.batch_actions = false
  filter :user, :collection => User.all.map(&:email)
  filter :event
  
  
  index do 
    column :user_id do |row|
      User.find(row.user_id).email
    end
    column :event_id do |row|
      event = Event.find(row.event_id)
      link_to event.title, event
    end
    default_actions
  end
end
