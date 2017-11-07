class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :title_must_be_clickbait

  def title_must_be_clickbait
    if self.title == nil || self.title.match(/((Won't Believe)|(Secret)|(Top)|(Guess))/) == nil
      self.errors.add(:title, "needs to be clickbait")
    end
  end
end
