# encoding : UTF-8
#
class ApiController < ApplicationController
  def show
    status = param_validation(params[:lat],params[:lng],params[:radius],params[:mxnum])
    if status == 0 then
        lat = params[:lat].to_f
        lng = params[:lng].to_f
        if params[:radius].blank?
            radius = 500
        else
            radius = params[:radius].to_f
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
