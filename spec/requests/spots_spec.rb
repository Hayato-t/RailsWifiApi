require 'rails_helper'

RSpec.describe "Spots", type: :request do
  describe "GET /api/show" do
    context "正常系" do
      before(:all) do
        get '/api/show?lat=35.691638&lng=139.704616&radius=3000&mxnum=500'
        @json = JSON.parse(response.body)
      end

      it "Returns 200 OK" do
        expect(response).to have_http_status(200)
      end
  
      it "response.body is a json document and each contains jaaddress, janame, distance" do
        expect(@json).to be_a_kind_of(Array)
        for documents in @json do
          expect(documents).to have_key('jaaddress')
          expect(documents).to have_key('janame')
          expect(documents).to have_key('distance')
        end
      end
      it "distance is calculated by Haversine formula: d = 6371000 * 2 * asin(sqrt(sin(Radian(lat2-lat1)/2)**2+cos(Radian(lat2))cos(Radian(lat1))sin(Radian(lng2-lng1)/2**2))), and the margin of errors to local calculation is sufficiently small" do
        for documents in @json do
          lat1 = 35.691638
          lng1 = 139.704616
          lat2 = documents['latitude'].to_f
          lng2 = documents['longitude'].to_f
          inp = Math::sin(radian(lat2-lat1)/2)**2 + Math::cos(radian(lat2))*Math::cos(radian(lat1))*(Math::sin(radian(lng2-lng1)/2)**2)
          d = 6371000 * 2 * Math::asin(Math::sqrt(inp))
          expect((documents['distance'].to_f-d).abs).to be <= 10 ** -3
        end
      end
          
      it "works even when radius or mxnum is not given" do
        get '/api/show?lat=35.691638&lng=139.704616&mxnum=500'
        expect(response).to have_http_status(200)
        get '/api/show?lat=35.691638&lng=139.704616&radius=3000'
        expect(response).to have_http_status(200)
      end
    end
    context "異常系" do
      it "Returns 404 Error when lat or lng is empty or not Float" do
        get '/api/show?lat=35.691638&radius=3000&mxnum=500'
        expect(response).to have_http_status(404)
        get '/api/show?lng=139.704616&radius=3000&mxnum=500'
        expect(response).to have_http_status(404)
        get '/api/show?lat=hoge&radius=3000&mxnum=500'
        expect(response).to have_http_status(404)
        get '/api/show?lng=fuga&radius=3000&mxnum=500'
        expect(response).to have_http_status(404)
      end
    end
  end
end

def radian(deg)
  mypi =3.141592653589793116
  deg * mypi / 180.0
end
