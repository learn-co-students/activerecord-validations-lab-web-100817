class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :content, minimum: 250
  validates_length_of :summary, maximum: 250
  validates_inclusion_of :category, in: ['Fiction', 'Non-Fiction']

  validate :clickbait

  def clickbait
    errors.add(:base, 'not baity enough') if !self.title || !baity
  end

  def baity
    cba = ["Won't Believe","Secret","Top[number]","Guess"]
    cba.each { |cb| return true if self.title.include?(cb)}
    false
  end

end
