# frozen_string_literal: true

class ApplicationController < ActionController::API
  def page
    @page ||= params.fetch(:page, 1)
  end

  def per_page
    @per_page ||= params.fetch(:per_page, 10)
  end
end
