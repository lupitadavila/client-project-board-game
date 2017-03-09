class Game < ApplicationRecord
  belongs_to :category
  has_many :subscriptions
  has_many :followers, through: :subscriptions, source: :user
  has_many :comments
  has_many :votes, as: :voteable

  validates :title, :description, presence: true

  # Return total number of votes by summing up values of vote objects
  def vote_total
    self.votes.reduce(0){|sum, vote| sum + vote.value}
  end
end
