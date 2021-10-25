require 'swagger_helper'

describe 'api/v1/ahoy_controller', type: :request do
  path '/api/v1/ahoy' do
    get 'Get Ahoy Heartwarming Welcome' do
      tags 'Ahoy'
      consumes 'application/json'
      produces 'application/json'
      security [{ api_key: [] }]
      response '200', 'Ahoy index' do
        schema type: :object,
               properties: {
                 title: { type: :string },
                 message: { type: :string },
                 status: { type: :id }
               },
               required: %w[title message status]
        let(:api_key) { 'foobar' }
        run_test!
      end

      response '401', 'invalid token' do
        let(:api_key) { 'barfoo' }
        run_test!
      end
    end
  end
end
