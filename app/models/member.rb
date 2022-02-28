class Member < ApplicationRecord
  validates :name, presence: { message: '請填入名稱' }
end
