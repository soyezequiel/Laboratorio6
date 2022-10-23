class LocationsController < ApplicationController
  def create
    previous_lat = session[:lat]

    session[:lat] = params[:lat].to_f
    session[:lng] = params[:lng].to_f

    if previous_lat.nil? && session[:lat].present?
      #render: monster_path
      puts "-----------------------------------------------> Haciendo la redireccion"
      redirect_back fallback_location: root_path
    end
  end
end
