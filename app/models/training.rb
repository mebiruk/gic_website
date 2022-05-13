class Training < ApplicationRecord
    validates :training_name , :presence => true,:length => { :within => 2..50 }
    validates :study_level , :presence => true
    validates :training_duration , :presence => true
  ##scope
  	scope :recently_added, lambda { where('created_at >= ?', 1.week.ago)}
  	scope :undergraduate, lambda { where(study_level: "undergraduate")}
  	scope :graduate, lambda { where(study_level: "graduate")}

  ##associations
	has_many :accreditations
  has_many :training_lists, dependent: :delete_all
  accepts_nested_attributes_for :training_lists, :allow_destroy => true
  has_one_attached :photo

  extend FriendlyId
  friendly_id :training_name
end
