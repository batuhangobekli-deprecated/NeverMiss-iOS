//
//  LoginResponse.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse:Mappable {
    var token: String?
    
    
    required init?(map: Map) {
        
    }
    func mapping(map:Map){
        token <- map["token"]
        
    }
}
