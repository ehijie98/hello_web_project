require "spec_helper"
require "rack/test"
require_relative '../../app'

RSpec.describe Application do
    include Rack::Test::Methods
  
    let(:app) { Application.new }
  
    context "GET /" do
        it 'returns 200 OK' do
            # Assuming the post with id 1 exists.
            response = get('/names')
    
            expect(response.status).to eq(200)
            expect(response.body).to eq("Julia, Mary, Karim")
        end

    
        it 'returns 404 Not Found' do
            response = get('/posts')
    
            expect(response.status).to eq(404)
            # expect(response.body).to eq(expected_response)
        end
    end

    context "POST /sort-names" do
        it 'returns 200 OK' do
          # Assuming the post with id 1 exists.
          response = post('/sort-names', names: "Joe,Alice,Zoe,Julia,Kieran")
          
          expect(response.status).to eq(200)
          expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
        end
    
        it 'returns 404 Not Found' do
          response = post('/names')
    
          expect(response.status).to eq(404)
        #   expect(response.body).to eq('returns 404 Not Found')
        end
    end
 end