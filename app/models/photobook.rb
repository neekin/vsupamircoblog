class Photobook < ActiveRecord::Base
  has_many:photos
  validates :bookname ,presence: true
end
