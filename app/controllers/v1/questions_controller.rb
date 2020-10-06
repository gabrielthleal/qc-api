# frozen_string_literal: true

module V1
  class QuestionsController < ApplicationController
    def index
      @questions = Question.page(page).per(per_page)

      render json: @questions
    end
  end
end
