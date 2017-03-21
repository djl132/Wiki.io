class Wiki < ApplicationRecord
  belongs_to :user

# immediately after initialization, now when I save
# , since i need to check attribute private before it's saved
  after_initialize {self.private ||= false}
  # before_save {self.private ||= true}

    # validation : use ACTIVERECORD (every model inherits from it)
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :user, presence: true


end
