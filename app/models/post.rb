class Post < ApplicationRecord
  belongs_to :profile
  belongs_to :user
  belongs_to :feed, optional: true


end
