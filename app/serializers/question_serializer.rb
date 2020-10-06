# frozen_string_literal: true

class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :statement, :text, :answer, :daily_access, :discipline, :created_at, :updated_at

  has_many :question_access
end
