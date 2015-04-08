class Event < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :category

  has_many :attendees, :dependent => :destroy
  has_many :event_groupships
  has_many :groups, :through => :event_groupships
  # 透過groups來和event_groupships產生關聯
  has_one :event_detail, :dependent => :destroy
  accepts_nested_attributes_for :event_detail, :allow_destroy => true, :reject_if => :all_blank
end
