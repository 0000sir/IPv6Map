namespace :ipv6 do
    task :detect => :environment do
        Organization.where("domain not null").each do |org|
            org.check_ipv6
        end
    end
end