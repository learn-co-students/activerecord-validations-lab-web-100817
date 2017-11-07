class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :is_clickbait

  def is_clickbait
    title = self.title.to_s
    clickbait_array = ["Won't Believe", "Secret", "Top ", "Guess"]
    clickbait_array.each do |element|
      if title.include?(element)
        return true
      else
        errors.add(:title, "Isn't clickbait-y enough!")
      end
    end
  end

end
