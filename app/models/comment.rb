class Comment < ActiveRecord::Base
  belongs_to :recipe
  validates :name, :body, presence: true
end
