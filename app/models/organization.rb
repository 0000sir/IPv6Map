class Organization < ApplicationRecord
    after_save :set_map_info
    def self.load_from_ustc
        require 'ustc'
        organizations = USTC.get_all
        organizations.each do |org|
            o = Organization.find_or_create_by name: org['name'], domain: org['hostname']
            o.update_attributes ipv4: org['ipv4'],
                httpsv4: org['httpsv4'], http2v4: org['http2v4'], httpv4: org['httpv4'],
                ipv6: org['ipv6'], httpsv6: org['httpsv6'], http2v6: org['http2v6'], httpv6: org['httpv6'],
                score: org['score']
        end
    end

    def set_map_info
        if self.longitude.blank? or self.latitude.blank?
            begin
                map_data =  BaiduMap.search_map self.name
                self.update_attributes latitude: map_data['location']['lat'],
                longitude: map_data['location']['lng'], address: map_data['address'],
                province: map_data['province'], city: map_data['city'], area: map_data['area'],
                telephone: map_data['telephone']
            rescue => e
                p e
            end
        end
    end
end
