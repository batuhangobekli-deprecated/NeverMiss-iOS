//
//  NeverMissApiClient.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import SwiftKeychainWrapper


class BitabakApiClient: RequestAdapter{
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        if let accessToken = KeychainWrapper.standard.string(forKey: "token") {
            urlRequest.setValue("Token " + accessToken , forHTTPHeaderField: "Authorization")
        }
        return urlRequest
        
    }
}
