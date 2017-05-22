# encoding : UTF-8
#
class ApiController < ApplicationController
  def show
    lat = params[:lat]
    lng = params[:lng]
    if params[:radius].blank?
        radius = 500
    else
        radius = params[:radius]
    end
    
    if params[:mxnum].blank?
        mx = 5
    else
        mx = params[:mxnum]
    end
    data = Spot.find_by_sql(["SELECT janame,jaaddress,(6371 * 1000 * ACOS(COS(RADIANS(latitude)) * COS(RADIANS(:a)) * COS(RADIANS(longitude) - RADIANS(:b)) + SIN(RADIANS(:a)) * SIN(RADIANS(latitude)))) AS distance FROM spots HAVING distance <= :c ORDER BY distance LIMIT :d",{a: lat,b: lng,c: radius,d: mx}])
    render :json => data
  end
end
