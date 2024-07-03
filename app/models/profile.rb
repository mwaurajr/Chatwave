class Profile < ApplicationRecord
  belongs_to :user
  STATUS_EMOJIS = ["💼", "🎓", "✈️", "🏡", "👨‍💻", "📚", "🎨", "🎉", "💼"].freeze
end
