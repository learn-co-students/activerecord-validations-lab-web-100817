class TitleValidator < ActiveModel::Validator
  def validate(record)
    if record.title
      unless record.title.match(/((Won't Believe)|(Secret)|(Top \d+)|(Guess))/i)
        record.errors[:title] << 'Not Sufficiently Click-Baity'
      end
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with TitleValidator
end