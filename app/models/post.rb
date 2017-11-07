class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:content, {length:{minimum: 250}})
  validates(:summary, {length:{maximum: 250}})
  validates :category, inclusion: { in: %w(Non-Fiction Fiction)}
  validate :is_clickbait?

  def is_clickbait?
    click_bait = [/Won't Believe/, /Secret/, /Top/, /Guess/]
    if click_bait.none?{ |params| params =~ title}
      errors.add(:title, "must be clickbait")
    end
  end

end
