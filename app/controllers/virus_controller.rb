class VirusController < ApplicationController
  def corona
    require 'net/http'
    url = "https://corona.lmao.ninja/countries"
    @countries = JSON.parse(Net::HTTP.get(URI.parse(url)))
    # data = eval(data)
    # render json:@countries.size and return
    # data = eval(data)
  end
end