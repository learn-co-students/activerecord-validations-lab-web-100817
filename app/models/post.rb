class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non Fiction) }
  validate :clickbait

  def clickbait
    words = ["Won't Believe", "Secret", "Top", "Guess"]
    if title
      blah = words.any? do |word|
        title.include?(word)
      end
    end
    if !blah
      errors.add(:title, "Not clickbait")
    end
  end

end
