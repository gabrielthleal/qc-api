# frozen_string_literal: true

module V1
  class QuestionsController < ApplicationController
    def index
      @questions = Question.page(page).per(per_page)

      render json: @questions
    end

    def disciplines
      @disciplines = QuestionAccess.page(page).per(per_page).most_accessed_disciplines

      render json: @disciplines
    end
  end
end
