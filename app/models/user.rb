class User < ActiveRecord::Base

  has_many :skills, through: :skill_users
  has_many :skill_users
  
  def proficiency_for(skill)
    skill_user = self.skill_users.where(skill_id: skill.id).first
    if skill_user.blank?
    	return 0
    else
    	return skill_user.proficiency
    end
  end

  def set_proficiency_for(skill, rating)
    skill_user = self.skill_users.where(skill_id: skill.id).first
    skill_user.update_attributes(proficiency: rating)
  end

end
