class Puppy < ActiveRecord::Base
  validates :name, :dob, :breed, presence: true

  def new
  end
end
