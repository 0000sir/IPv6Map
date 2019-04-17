require 'open-uri'
module BaiduMap
    APP_KEY=ENV["BAIDU_MAP_KEY"]
    def BaiduMap.search_map(name, area="中国")
        organization = URI.encode(name)
        region = URI.encode(area)
        url = "http://api.map.baidu.com/place/v2/search?query=#{organization}&region=#{region}&output=json&ak=#{APP_KEY}"
        map_data = JSON.parse URI.parse(url).read
        p map_data
        if map_data['status'] == 0
            info = map_data['results'].first
            unless info['location'].nil?
                return info
            else
                BaiduMap.search_map(name, "北京")
            end
        end
    end
end