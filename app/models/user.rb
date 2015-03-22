class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, presence: true
  has_secure_password
  has_many :puppies
  has_many :barks_sent, :class_name => 'Bark', :foreign_key => 'sender_id'
  has_many :barks_received, :class_name => 'Bark', :foreign_key => 'receiver_id'

  def new
  end
end
