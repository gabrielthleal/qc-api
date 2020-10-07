# frozen_string_literal: true

require 'acceptance_helper'

resource 'Questions' do
  get '/v1/questions' do
    parameter :page, 'Question page', default: '1'
    parameter :per_page, 'Questions per page', default: '10'
    parameter :by_week, 'Just pass the date like year-month-day'
    parameter :by_month, 'Just pass the year and month as number xxxx-xx'
    parameter :by_year, 'Just pass the year as number xxxx'

    example '[GET] Listing questions - 200' do
      do_request

      expect(status).to eq 200
    end

    describe 'Question Filters' do
      before { create_list(:question, 3, :with_access) }

      context 'when return the most accessed questions from a week' do
        before { create_list(:question_access, 2, date: '2020-10-07'.to_time + 8.days) }

        example '[GET] most accessed questions from a week - 200' do
          do_request({ by_week: '2020-10-07' })

          body = JSON(response_body)

          expect(status).to eq 200
          expect(body.size).to eq 3
        end
      end

      context 'when return the most accessed questions from a month' do
        before { create_list(:question_access, 2, date: '2020-10-07'.to_time + 32.days) }

        example '[GET] most accessed questions from a month - 200' do
          do_request({ by_month: '2020-10' })

          body = JSON(response_body)

          expect(status).to eq 200
          expect(body.size).to eq 3
        end
      end

      context 'when return the most accessed questions from a year' do
        before { create_list(:question_access, 2, date: '2020-10-07'.to_time + 2.years) }

        example '[GET] most accessed questions a from year - 200' do
          do_request({ by_year: '2020' })

          body = JSON(response_body)

          expect(status).to eq 200
          expect(body.size).to eq 3
        end
      end
    end
  end

  get '/v1/disciplines' do
    parameter :page, 'Discipline page', default: '1'
    parameter :per_page, 'Disciplines per page', default: '10'

    describe 'most accessed disciplines by day' do
      before do
        create(:question, daily_access: 5)
        create(:question, daily_access: 10)
        create(:question, daily_access: 1)
      end

      context 'when returns the right order' do
        example '[GET] Most accessed disciplines - 200' do
          do_request

          body = JSON(response_body)

          expect(status).to eq 200

          expect(Question.second.discipline).to eq body.first
          expect(Question.first.discipline).to eq body.second
          expect(Question.third.discipline).to eq body.third
        end
      end
    end
  end
end
