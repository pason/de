class Event < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	belongs_to :user
	validates_presence_of :name, :description, :start_time, :end_time

	has_attached_file :logo, :styles => {:banner => "800x295" ,:medium => "300x300>", :thumb => "100x100#" }, :default_url => ':style/missing.png'
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

end
