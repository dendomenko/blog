class Post < ApplicationRecord
  belongs_to :status

  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :title, presence: true
  validates :body, presence: true

  def self.published
    Post.all.where(status_id: 2)
  end

  def self.unpublished
    Post.all.where(status_id: 1)
  end

  def body_html_safe
    body.html_safe
  end
end
