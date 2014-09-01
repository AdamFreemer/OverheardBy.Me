class Topic < ActiveRecord::Base
	has_many :votes, dependent: :destroy
	acts_as_taggable
end
