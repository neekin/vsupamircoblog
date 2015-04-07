class Comment < ActiveRecord::Base
  belongs_to:mircoblog
  belongs_to:photo
  belongs_to:user
  validates :comment, presence: true
end
