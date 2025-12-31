class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :vegetable, optional: true

  validates :purchased_on, presence: true
  validates :custom_name, length: { maximum: 50 }, allow_blank: true

  validate :vegetable_or_custom_name_xor

  def display_name
    vegetable&.name.presence || custom_name
  end

  private

  def vegetable_or_custom_name_xor
    veg_present = vegetable_id.present?
    custom_present = custom_name.present?

    # 両方空 or 両方入力されている場合はNG
    if veg_present == custom_present
      errors.add(:base, '野菜を選ぶか、自由入力のどちらか一方を入力してください')
    end
  end
end
