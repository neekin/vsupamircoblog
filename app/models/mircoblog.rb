class Mircoblog < ActiveRecord::Base
  belongs_to:user
  has_many:comments
  validates :sharetext, presence: true
end
