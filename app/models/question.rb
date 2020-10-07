# frozen_string_literal: true

class Question < ApplicationRecord
  scope :most_daily_accessed, -> { order(daily_access: :desc).map(&:discipline).uniq }
  # scope :most_accessed_by_periode, lambda(from, to) {
  #   where('created_at: >= ? AND created_at: <= ?', from, to).order(daily_access: :desc)
  # }
end
