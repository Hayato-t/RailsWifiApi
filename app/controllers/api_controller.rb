# encoding : UTF-8
#
class ApiController < ApplicationController
  def show
#    lat = params[:lat]
#    lng = params[:lng]
    status = param_validation(params[:lat],params[:lng],params[:radius],params[:mxnum])
    if status == 0 then
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
            mx = params[:mxnum].to_i
        end
        data = Spot.WifiSearch(lat,lng,radius: radius,mxnum: mx)
        render :json => data
    elsif status == 1 then
        render :json => [],status: 404
    elsif status == 2 then
        render :json => [],status: 404
    end
#    data = Spot.find_by_sql(["SELECT janame,jaaddress,(6371 * 1000 * ACOS(COS(RADIANS(latitude)) * COS(RADIANS(:a)) * COS(RADIANS(longitude) - RADIANS(:b)) + SIN(RADIANS(:a)) * SIN(RADIANS(latitude)))) AS distance FROM spots HAVING distance <= :c ORDER BY distance LIMIT :d",{a: lat,b: lng,c: radius,d: mx}])
  end
  def param_validation(latitude,longitude,radius,maximum)
    # latitude and longitude must not be empty
    if latitude.blank? or longitude.blank? then
        return 1
    end
    if float_string?(latitude) and float_string?(longitude) and (float_string?(radius) or radius.blank?) and (integer_string?(maximum) or maximum.blank?) then
        return 0
    else
        return 2
    end
  end
  def integer_string?(str)
    if str.blank? then
        false
    else
        Integer(str)
        true
    end
  rescue ArgumentError
    false
  end
  def float_string?(str)
    if str.blank? then
        false
    else
        Float(str)
        true
    end
  rescue ArgumentError
    false
  end
end
