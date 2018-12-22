//
//  Remainders.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation
import ObjectMapper

struct RemainderResponse : Mappable {
    var count : Int?
    var next : String?
    var previous : String?
    var results : [Remainder]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
        results <- map["results"]
    }
    
}
