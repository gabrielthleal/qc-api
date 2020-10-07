# frozen_string_literal: true

class QuestionAccess < ApplicationRecord
  belongs_to :question

  scope :most_accessed_disciplines, lambda {
    where(date: Date.today).order(times_accessed: :desc)
                           .joins(:question)
                           .select(:discipline)
                           .map(&:discipline).uniq
  }
end
