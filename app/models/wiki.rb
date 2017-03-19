class Wiki < ApplicationRecord
  belongs_to :user


    # validation : use ACTIVERECORD (every model inherits from it)
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :user, presence: true


end
