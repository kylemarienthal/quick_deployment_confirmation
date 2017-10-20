class Message < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :event, required: true

  validates :content, presence: true, length: { minimum: 2 }
end
