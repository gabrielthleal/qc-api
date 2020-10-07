# frozen_string_literal: true

module V1
  class QuestionsController < ApplicationController
    def index
      @questions = questions_by_period.nil? ? questions : questions_by_period

      render json: @questions, serializer_each: QuestionSerializer
    end

    def disciplines
      @disciplines = Question.page(page).per(per_page).most_daily_accessed

      render json: @disciplines.map(&:discipline).uniq, serializer_each: QuestionSerializer
    end

    private

    def questions_by_period
      return if params.nil?

      return questions.most_accessed_by_year("#{params[:by_year]}-01-01") if params[:by_year].present?

      return questions.most_accessed_by_month("#{params[:by_month]}-01") if params[:by_month].present?

      return questions.most_accessed_by_week(params[:by_week]) if params[:by_week].present?
    end

    def questions
      @questions ||= Question.page(page).per(per_page)
    end
  end
end
