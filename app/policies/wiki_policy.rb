class WikiPolicy < ApplicationPolicy
  def initialize(user,record)
    @user = user
    @record = record
  end
  def update?
    user.present?
  end


end
