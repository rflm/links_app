class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_reputation :votes, source: :user, aggregated_by: :sum
  validates :title, presence: true
  validates :url, presence: true
end
