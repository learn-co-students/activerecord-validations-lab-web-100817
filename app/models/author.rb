class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, length: {minimum: 10}
  validates :name, uniqueness: true

end

# t.string :name
# t.string :phone_number
# #  validates :email, uniqueness: true
# validates :name, length: { minimum: 2 }
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



# rspec ./spec/models/author_spec.rb:14 # Author is invalid with a short number
# rspec ./spec/models/author_spec.rb:19 # Author is invalid when non-unique
# rspec ./spec/models/post_spec.rb:26 # Post is invalid without a title
# rspec ./spec/models/post_spec.rb:30 # Post is invalid with too short content
# rspec ./spec/models/post_spec.rb:34 # Post is invalid with a long summary
# rspec ./spec/models/post_spec.rb:38 # Post is invalid with a category outside the choices
# rspec ./spec/models/post_spec.rb:42 # Post is invalid if not clickbait
