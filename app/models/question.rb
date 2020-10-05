# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :question_access
end
