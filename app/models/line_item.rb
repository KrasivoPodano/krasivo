class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :event_id
  belongs_to :event
  belongs_to :cart
end
