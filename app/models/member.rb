class Member < ApplicationRecord
  has_many :attachments, dependent: :destroy

  validates 'name_zh-TW', presence: { message: '請填入名稱' }
  validates 'name_en', presence: { message: 'please fill in name' }

  before_create :set_slug

  private

  def set_slug
    self.slug = Digest::SHA2.hexdigest(name_en).first(10)
  end
end
