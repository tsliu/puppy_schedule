class Bark < ActiveRecord::Base

  validates :sender_id, :priority, :preview, :text, presence: true

  belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
  belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_id'

  def self.generate_empty_bark(sender)
    @bark = Bark.new
    @bark.priority = 5
    @bark.sender = sender
    @bark
  end

  def self.populate_preview_with_text(bark)
    bark.preview = bark.text.truncate(100)
  end

  def self.from_user(user)
    Bark.where(:sender => user).limit(50)
  end

  def self.to_user(user)
    Bark.where(:receiver => user).limit(50)
  end

  def self.public_noise
    Bark.where(:receiver => nil).limit(50)
  end
end
