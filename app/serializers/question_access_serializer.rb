# frozen_string_literal: true

class QuestionAccessSerializer < ActiveModel::Serializer
  attributes :id, :question_id, :date, :times_accessed, :created_at, :updated_at

  belongs_to :question
end
