class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 200}
  validates :summary, length: { maximum: 20}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

    def is_clickbait?
      if CLICKBAIT_PATTERNS.none? {|pat| pat.match title}
        errors.add(:title, "must be clickbait")
      end
    end
end

# t.string :title
# t.text :content
# t.text :summary
# t.string :category


#  validates :name, length: { minimum: 2 }
#  validates :email, uniqueness: true
#  validates :name, presence: true
#  validates :bio, length: { maximum: 500 }
#  validates :password, length: { in: 6..20 }
#  validates :registration_number, length: { is: 6 }
#
#  validates(:name, { :length => { :minimum => 2 } })
#   validates(:bio, { :length => { :maximum => 500 } })
#   validates(:password, { :length => { :in => 6..20 } })
#   validates(:registration_number, { :length => { :is => 6 } })
#   validates :email, uniqueness: true
#   validates :not_a_robot, acceptance: true, message: "Humans only!"
