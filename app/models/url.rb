class Url < ActiveRecord::Base
  validates :long_url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true

	# validates_format_of :url, :with => /^\b((?:https?:\/\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))$/
	belongs_to :user
end
