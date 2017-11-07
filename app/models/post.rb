class Post < ActiveRecord::Base
  validates(:title, presence: true)
  validates(:content, length: {minimum: 250})
  validates(:summary, length: {maximum: 250})
  validates(:category, inclusion: {in: %w(Fiction Non-Fiction)})
  validate(:clickbait?)
end


def clickbait?
  unless self.title == nil || self.title.match(/((Won't Believe)|(Secret)|(top)|(Guess))/)
    errors.add(:title, "not clickbait-y enough")
  end
end
