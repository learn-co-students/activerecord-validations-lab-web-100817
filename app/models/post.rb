class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non_Fiction)}
  validate :ClickBait


  def ClickBait
  y= title ||[]
  allowed_values = ["Won't Believe", "Secret", "Top [number]","Guess"]
  errors.add(:title, "does not contain magic words") unless allowed_values.any? {|x| y.include?(x)}
  end

end
