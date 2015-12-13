class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 5000 }
  validates :picture, presence: true

  mount_uploader :picture, PictureUploader

  acts_as_taggable
end
