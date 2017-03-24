class Collaborator < ApplicationRecord

  belongs_to :wiki
  belongs_to :user

# plural query for a group of collaborators
  def self.users
    User.where(id: pluck(:user_id))
  end

end
