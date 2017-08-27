class Post < ApplicationRecord
  belongs_to :user
  has_many :votes

  counter_culture :user
end
