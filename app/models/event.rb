class Event < ActiveRecord::Base
  attr_accessible :title, :date, :text, :album_id, :event_type_id, :main, :shorttext, :eventdetails, :front_images_attributes, :price
  scope :main, where(:main => true)
  scope :with_images, includes(:front_images).where( :front_images => {:event_id=>true} )
  belongs_to :album
  belongs_to :event_type
  has_many :front_images
  has_many :orders
  has_many :line_items
  has_many :carts, :through => :line_items
  has_many :appointments
  has_many :users, :through => :appointments
  accepts_nested_attributes_for :front_images, :allow_destroy => true
  validates :title, :date, :text, :event_type_id, :price, :presence => true
  validates :shorttext, :length => { :maximum => 125 }
  validates :eventdetails, :length => { :maximum => 70 }
  just_define_datetime_picker :date, :add_to_attr_accessible => true
  before_destroy :ensure_not_referenced_by_any_line_item
  
  private
  
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add('Line Items present')
      return false
    end
  end
  
end