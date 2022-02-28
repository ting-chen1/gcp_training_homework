class Member < ApplicationRecord
  has_many :attachments, dependent: :destroy

  validates :name, presence: { message: '請填入名稱' }
end
