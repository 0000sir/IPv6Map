#require 'net/http'
#require 'nokogiri'
require 'open-uri'
require 'json'
require 'baidu_map'
module USTC
    USTC_URLS = ["https://ipv6.ustc.edu.cn/result.json.php?groupid=2&random=0.4076284539874565", 
    "https://ipv6.ustc.edu.cn/result.json.php?groupid=3&random=0.8097823863579697",
    "https://ipv6.ustc.edu.cn/result.json.php?groupid=4&random=0.06802251782929547",
    "https://ipv6.ustc.edu.cn/result.json.php?groupid=5&random=0.43952151404562545"]
    def USTC.fetch_url(url)
        raw_data = JSON.parse URI.parse(url).read
        organizations = raw_data['myTable']
        return organizations
    end

    def USTC.get_all
        organizations = []
        USTC_URLS.each do |url|
            organizations.concat USTC.fetch_url(url)
        end
        return organizations
    end
end