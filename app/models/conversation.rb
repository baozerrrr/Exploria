class Conversation < ActiveRecord::Base
	belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
	belongs_to :recepient, foreign_key: :recepient_id, class_name: 'User'

	has_many :messages, dependent: :destroy

	validates_uniqueness_of :sender_id, scope: :recepient_id

	scope :involving, -> (user) do 
		where ('conversations.sender_id = ? OR conversations.recepient_id = ?', user.id, user.id)

		
	end

	scope :between, -> (sender_id, recepient_id) do
		where ('(conversations.sender_id = ? AND conversations.recepient_id = ?) OR (conversations.sender_id = ? AND conversations.recepient_id = ?)', 
			sender_id, recepient_id, recepient_id, sender_id)
	end

end
