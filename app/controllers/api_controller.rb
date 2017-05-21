# encoding : UTF-8
#
class ApiController < ApplicationController
  def show
    
    data = Spot.find_by_sql(["SELECT janame,jaaddress,(6371 * 1000 * ACOS(COS(RADIANS(latitude)) * COS(RADIANS(:a)) * COS(RADIANS(longitude) - RADIANS(:b)) + SIN(RADIANS(:a)) * SIN(RADIANS(latitude)))) AS distance FROM spots HAVING distance <= :c ORDER BY distance",{a: params[:lat],b: params[:lng],c: params[:radius]}])
    render :json => data
  end
end
