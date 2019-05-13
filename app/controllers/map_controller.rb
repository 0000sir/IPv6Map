class MapController < ApplicationController
  def index
    @organizations = Organization.where("longitude is not null and latitude is not null and ipv6=1")
    render 'cluster' if !params[:v].blank? and params[:v].eql?('cluster')
  end
  
  def no_ipv6
    #@organizations = Organization.where("longitude is not null and latitude is not null and (ipv6=0 or ipv6 is null)")
    #render 'cluster'
    render plain: "算了还是不显示吧"
  end
end
