require 'dotenv'
require 'json'
Dotenv.load

class CuisinesController < ApplicationController

  def cuisines
#@response =  RestClient.get "https://developers.zomato.com/api/v2.1/cities?q=#{params["city"]}",
      #{content_type: :json, accept: :json, "user-key": ENV["API_KEY"]}
      @response = RestClient.get "https://canadiancollege.ampeducator.ca/api/student/get?apiKey=#{ENV['API_KEY']}&studentAssignedID=#{params["student_id"]}"

    # @city_info = JSON.parse(@response.body)["location_suggestions"][0]
      @student_info = JSON.parse(@response.body)["data"][0]
      @first_name = @student_info["firstName"]
      @last_name = @student_info["lastName"]
    #if @city_info
    # @cuisines = RestClient.get "https://developers.zomato.com/api/v2.1/cuisines?city_id=#{@city_info["id"]}",
      # {content_type: :json, accept: :json, "user-key": ENV["API_KEY"]}

    #   @city_info["cuisines"] = JSON.parse(@cuisines.body)["cuisines"]

      # render json: @city_info
      render json: @first_name + " " + @last_name
    # else
      # render json: {message: "Student Not Found"}
     #end
  end

  def photos
    #@response = RestClient.get ENV['URL']
    @response = RestClient.get "https://canadiancollege.ampeducator.ca/api/student/get?apiKey=#{ENV['API_KEY']}&imageDocumentID=0&currentStatus=Enrolled&currentProgramStatus=enrolled"
    @students_info = JSON.parse(@response.body)["data"]
    #@emails = @student_info["email"]
    #render json: @students_info
  end
end
