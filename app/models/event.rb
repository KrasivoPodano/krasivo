class Event < ActiveRecord::Base
  attr_accessible :title, :date, :text, :album_id, 
                  :event_type_id, :main, :shorttext, 
                  :eventdetails, :front_images_attributes, :price, :published, :property,
                  :html_title, :seo_url, :meta_description,
                  :filled, :want_more, :duration

  extend FriendlyId
  friendly_id :seo_url, use: :slugged
  scope :main, where(:main => true)
  scope :filled, where(:filled => true)
  scope :not_filled, where(:filled => false)
  scope :future, where{(date == nil) | (date >= Time.now)}
  scope :past, where("date <= ?", Time.now)
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
  validates :title, :text, :event_type_id, :price, :presence => true
  validates :shorttext, :length => { :maximum => 125 }
  validates :eventdetails, :length => { :maximum => 70 }
  just_define_datetime_picker :date, :add_to_attr_accessible => true
  scope :published, -> { where(published: true) }
  scope :courses, -> { where(property: "course") }
  scope :master_classes, -> { where(property: "master") }
  PROPERTIES = %w[master course]
  
  def publish 
    self.published = true
    self.save
  end
  
  def past?
    self.date && self.property != 'course' && self.date.past? 
  end
    
  
end