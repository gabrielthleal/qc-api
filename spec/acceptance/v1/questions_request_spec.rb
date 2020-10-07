# frozen_string_literal: true

require 'acceptance_helper'

resource 'Questions' do
  get '/v1/questions' do
    parameter :page, 'Question page', default: '1'
    parameter :per_page, 'Questions per page', default: '10'
    parameter :week, 'Hottest questions from week by accesses'
    parameter :month, 'Hottest questions from month by accesses'
    parameter :year, 'Hottest questions from year by accesses'

    example 'Listing questions' do
      do_request

      expect(status).to eq 200
    end

    describe 'Question Filters' do
      context 'when return the hottest questions from week by access' do
        example '[GET] hottest questions from week - 200' do
          do_request(params: :week)

          expect(status).to eq 200
        end
      end

      context 'when return the hottest questions from month by access' do
        example '[GET] hottest questions from month - 200' do
          do_request(params: :month)

          expect(status).to eq 200
        end
      end

      context 'when return the hottest questions from year by access' do
        example '[GET] hottest questions from year - 200' do
          do_request(params: :year)

          expect(status).to eq 200
        end
      end
    end
  end

  get '/v1/disciplines' do
    parameter :page, 'Discipline page', default: '1'
    parameter :per_page, 'Disciplines per page', default: '10'

    describe 'most accessed disciplines' do
      before do
        create_list(:question_access, 3)
        create_list(:question_access, 3, date: Date.today - 1)
      end

      context 'when return the most accessed disciplines' do
        example '[GET] Most accessed disciplines - 200' do
          do_request

          body = JSON(response_body)

          expect(status).to eq 200
          expect(body.size).to eq 3
        end
      end
    end
  end
end
