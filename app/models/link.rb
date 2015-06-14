class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_reputation :votes, source: :user, aggregated_by: :sum
  validates :title, presence: true
  validates :url, presence: true

  scope :with_comments_count, -> { joins(:comments).select("links.*, COUNT(comments.id) AS comments_count").group("links.id") }
end
