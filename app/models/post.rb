
# class TitleValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless
#       record.errors[attribute] << (options[:message] || "is not click-baity")
#     end
#   end
# end


class Post < ActiveRecord::Base
  validate :non_clickbait
  validates :title, presence: true
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 100}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }


  def non_clickbait
    if self.title != nil && !self.title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, "Include a word")
    end
  end

end
