class Stock < ApplicationRecord
  attr_accessor :mode

  belongs_to :user
  belongs_to :vegetable, optional: true

  validates :purchased_on, presence: true
  validates :custom_name, length: { maximum: 50 }, allow_blank: true

  validate :vegetable_or_custom_name_xor

  def display_name
    vegetable&.name.presence || custom_name
  end

  def elapsed_days
    return nil if purchased_on.blank?

    (Date.current - purchased_on).to_i
  end

  def freshness_label
    return nil if elapsed_days.nil?

    case elapsed_days
    when 0
      "今日買った"
    when 1..3
      "3日以内"
    when 4..7
      "1週間以内"
    else
      "注意"
    end
  end

  def freshness_badge_class
    return "text-bg-light" if elapsed_days.nil?

    case elapsed_days
    when 0
      "text-bg-success"
    when 1..3
      "text-bg-primary"
    when 4..7
      "text-bg-warning"
    else
      "text-bg-danger"
    end
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
