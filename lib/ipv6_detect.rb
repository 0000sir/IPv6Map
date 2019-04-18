module Ipv6Detect
    # deletect with curl
    def Ipv6Detect.detect(hostname)
        rs = {httpv4: false, httpv6: false, httpsv4: false, httpsv6: false, http2v4: false, http2v6: false}
        http_url = "http://#{hostname}"
        https_url = "https://#{hostname}"
        # ipv6
        begin
            httpv6 = Ipv6Detect.run_curl6(http_url)
            rs[:httpv6] = httpv6[:http]
            rs[:http2v6] = httpv6[:http2]
            httpsv6 = Ipv6Detect.run_curl6(https_url)
            rs[:httsv6] = httpsv6[:http]
            rs[:https2v6] = httpsv6[:http2]
        rescue => e
            p "curl on ipv6 failed"
        end
        # ipv4
        begin
            httpv4 = Ipv6Detect.run_curl4(http_url)
            rs[:httpv4] = httpv4[:http]
            rs[:http2v4] = httpv4[:http2]
            httpsv4 = Ipv6Detect.run_curl4(https_url)
            rs[:httpsv4] = httpsv4[:http]
            rs[:https2v4] = httpsv4[:http2]
        rescue => e
            p "curl on v4 failed"
        end
        return rs
    end

    def Ipv6Detect.run_curl6(url)
        cmd = "curl -L -I -6 --connect-timeout 3 -m 3 #{url}"
        output = `#{cmd}`
        Ipv6Detect.parse_curl_output(output)
    end

    def Ipv6Detect.run_curl4(url)
        cmd = "curl -L -I -4 --connect-timeout 3 -m 3 #{url}"
        output = `#{cmd}`
        Ipv6Detect.parse_curl_output(output)
    end

    def Ipv6Detect.parse_curl_output(output)
        return nil if output.blank?
        http = output.scan(/HTTP\/[1|2].* 200/).empty? ? false : true
        http2 = output.scan(/HTTP\/2.* 200/).empty? ? false : true
        return {http: http, http2: http2}
    end
end