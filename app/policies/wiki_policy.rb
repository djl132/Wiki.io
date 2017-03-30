class WikiPolicy < ApplicationPolicy
  def initialize(user,record)
    @user = user
    @record = record
  end
  def update?
    user == @record.user
    # redirect_to @record
  end



end
