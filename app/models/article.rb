class Article < ActiveRecord::Base
	acts_as_taggable
	validates :title,  presence: true
	validates :url, 	 presence: true
	validates :source, presence: true
end
