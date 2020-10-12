class Post < ApplicationRecord
  validates_presence_of :body, :title
  belongs_to :user
  has_many :comments, as: :commentable
  validates_presence_of :body
end
