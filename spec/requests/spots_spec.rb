require 'rails_helper'

RSpec.describe "Spots", type: :request do
  describe "GET /api/show" do
    context "正常系" do
      before(:all) do
        get '/api/show?lat=35.691638&lng=139.704616&radius=3000&mxnum=500'
        @json = JSON.parse(response.body)
        p @json[0]
      end

      it "Returns 200 OK" do
        expect(response).to have_http_status(200)
      end
  
      it "s response.body is json documents and each contains jaaddress, janame, distance" do
        expect(@json).to be_a_kind_of(Array)
        for documents in @json do
          expect(documents).to have_key('jaaddress')
          expect(documents).to have_key('janame')
          expect(documents).to have_key('distance')
        end
      end
    end
    context "異常系" do

    end
  end
end
