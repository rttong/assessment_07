class Skill < ActiveRecord::Base

  has_many :users, through: :skill_users
  has_many :skill_users

  validates_uniqueness_of :name

  def user_with_proficiency(rating)
    self.skill_users.where(proficiency: rating).first.user
  end

end
