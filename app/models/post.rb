require 'byebug'

class Post < ActiveRecord::Base
  # byebug
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_is_not_clickbait

  def title_is_not_clickbait
    clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]
    # return false if self.title == nil
    # clickbait_phrases.each do |phrase|
    #   if (!title || title.include?(phrase))
    #     errors.add(:title, "this is clickbait")
    #     return false
    #   end
    # end

    unless (title && title.include?("Won't Believe" || "Secret" || "Top" || "Guess"))
      errors.add(:title, "this is not clickbait")
    end
    # byebug
  end

end
