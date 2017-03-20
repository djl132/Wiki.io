class WikiPolicy < ApplicationPolicy
  def initialize(user,record)
    super(user, record)
  end
  def update?
    user.present?
  end


end
