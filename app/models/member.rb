class Member < ApplicationRecord
  has_many :attachments

  validates :name, presence: { message: '請填入名稱' }
end
