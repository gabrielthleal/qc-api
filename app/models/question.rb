# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :question_access

  # TODO: turn this discipline a method
  scope :most_daily_accessed, -> { order(daily_access: :desc) }

  scope :most_accessed_by_periode, lambda { |from, to|
    joins(:question_access).where('date >= ? AND date <= ?', from, to)
                           .order(times_accessed: :desc)
  }

  class << self
    def most_accessed_by_week(date)
      from = date.to_time.at_beginning_of_week
      to = date.to_time.at_end_of_week

      most_accessed_by_periode(from, to)
    end

    def most_accessed_by_month(date)
      from = date.to_time
      to = from.at_end_of_month

      most_accessed_by_periode(from, to)
    end

    def most_accessed_by_year(date)
      from = date.to_time
      to = from.at_end_of_year

      most_accessed_by_periode(from, to)
    end
  end
end
