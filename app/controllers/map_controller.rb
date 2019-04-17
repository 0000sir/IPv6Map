class MapController < ApplicationController
  def index
    @organizations = Organization.where("longitude is not null and latitude is not null and ipv6=1")
  end
end
