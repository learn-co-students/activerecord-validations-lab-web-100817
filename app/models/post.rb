class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  validate :title_is_not_clickbait


  def title_is_not_clickbait
    unless title == nil
      clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
      includes_bait = clickbait.any? {|bait| title.include?(bait)}
      unless includes_bait == true
        errors.add(:title, "is not clickbait")
      end
    end
  end



end
