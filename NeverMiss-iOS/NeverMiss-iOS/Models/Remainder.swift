//
//  Remainder.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation
import ObjectMapper

struct Remainder : Mappable {
    var id : Int?
    var name : String?
    var remainder_date : String?
    var description : String?
    var is_sent : Bool?
    var user : Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        remainder_date <- map["remainder_date"]
        description <- map["description"]
        is_sent <- map["is_sent"]
        user <- map["user"]
    }
    
}
