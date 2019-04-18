require 'nokogiri'
require 'open-uri'
require 'json'
module Hao123
    PROVINCES_FILE = Rails.root.join("db/provinces.json")
    ORGANIZATIONS_DIR = Rails.root.join("db/organizations")
    def Hao123.get_provinces
        url = "http://www.hao123.com/edu"
        links = {}
        page = URI.parse(url).read
        doc = Nokogiri::HTML(page)
        table = doc.css("div.edu-container table")
        rows = table.css("tr")
        headers = %w"地区 普通本科院校 高职院校 独立学院 成人高等学校"
        rows.each_with_index do |row, i|
            next if i==0
            columns = row.css("td")
            province = columns[0].text
            urls = {}
            for j in 1..4 do
                a = columns[j].css('a')
                p a
                unless a.empty?
                    link = a.attr('href').value 
                    urls[headers[j]] = link
                    p link
                end
            end
            links[province] = urls
        end
        # write json
        
        File.open(PROVINCES_FILE,"w") do |f|
            f.write(links.to_json)
        end
        return links
    end

    def Hao123.get_organizations
        # 1. read provinces
        provinces = JSON.parse File.read(PROVINCES_FILE)
        provinces.each_pair do |province, links|
            urls_file = ORGANIZATIONS_DIR.join("#{province}.json")
            urls = {}
            links.each_pair do |cate, link|
                orgs = Hao123.read_page(link)
                urls[cate] = orgs
            end
            File.open(urls_file,"w") do |f|
                f.write(urls.to_json)
            end
        end
    end

    def Hao123.read_page(url)
        page = URI.parse(url).read
        doc = Nokogiri::HTML(page,nil,"gb2312")
        links = doc.css('div.t1 table tr a')
        #links.map{|l| {l.text=>l.attr('href')}}
        urls = {}
        links.each {|x| urls[x.text]=x.attr('href')}
        return urls
    end
end