class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Non-Fiction Fiction)}
  validate :clickbait?
  
  def clickbait?
    clickbait_titles = ["Won't Believe", "Secret", "Top",  "Guess"]
    is_valid = false
    if self.title == nil
      return false
    end
    clickbait_titles.each do |phrase|
      if self.title.include?(phrase)
        return true
      end
    end
    if !is_valid 
      self.errors[:title] << "This title isn't clickbaity enought!"
    end
    is_valid

  end
end
