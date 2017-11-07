class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: %w(Fiction Non-Fiction)
  validate :contains_clickbait?

  def contains_clickbait?
    unless self.title == nil || self.title.match(/((Won't Believe)|(Secret)|(Top)|(Guess))/i)
      errors.add(:title, "must contain clickbait")
    end
  end

end
