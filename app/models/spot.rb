class Spot < ApplicationRecord
    def self.WifiSearch(lat,lng,radius: 500,mxnum: 5)
        @records= self.find_by_sql(["SELECT janame,jaaddress,(6371 * 1000 * ACOS(COS(RADIANS(latitude)) * COS(RADIANS(:a)) * COS(RADIANS(longitude) - RADIANS(:b)) + SIN(RADIANS(:a)) * SIN(RADIANS(latitude)))) AS distance FROM spots HAVING distance <= :c ORDER BY distance LIMIT :d",{a: lat,b: lng,c: radius,d: mxnum}])
    end
end
