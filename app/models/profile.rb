class Profile < ApplicationRecord
  has_attachment  :avatar, accept: [:jpg, :png, :gif]
  has_many :posts, dependent: :destroy
  belongs_to :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
