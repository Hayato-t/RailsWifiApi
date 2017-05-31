class Spot < ApplicationRecord
    def self.WifiSearch(lat,lng,radius: 500,mxnum: 5)
        @records= self.find_by_sql(["SELECT janame,jaaddress,latitude,longitude,(6371000 * 2 * ASIN(SQRT(POW(SIN(RADIANS(latitude - :a)/2.0),2) + COS(RADIANS(latitude)) * COS(RADIANS(:a)) * POW(SIN(RADIANS(longitude - :b)/2.0),2)))) AS distance FROM spots HAVING distance <= :c ORDER BY distance LIMIT :d",{a: lat,b: lng,c: radius,d: mxnum}])
    end
end
