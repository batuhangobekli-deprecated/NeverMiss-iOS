//
//  ApiManager.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import SwiftKeychainWrapper
import UIKit
import ObjectMapper

public class APIManager {
    let sessionManager = Alamofire.SessionManager.default
    var loadingPopUp = UIView()
    
   
    init() {}
    
    func register(firstName:String,lastName:String,password1:String,password2:String,last_name:String,email:String,currentViewController:UIViewController,context:UIView) -> Promise<Any> {
        let postString  = ["password1": password1,"password2": password2,"email": email,"first_name": firstName,"last_name":lastName] as [String:Any]
         return Promise { seal -> Void in
        loadingPopUp = UIViewController.displayPopUpLoading(baseView:(context))
        Alamofire.request(REGISTER_URL, method: .post, parameters: postString,encoding: URLEncoding.default)
            .validate()
            .responseString(encoding:String.Encoding.utf8){ response in
            
            switch response.result {
            case .success(let responseString):
                if let httpStatusCode = response.response?.statusCode {
                    if httpStatusCode == 200 {
                        print("200")
                    }
                }
                
            case .failure(let error):
                if let httpStatusCode = response.response?.statusCode {
                    if httpStatusCode == 401 {
                        print("401")
                    }
                }
                seal.reject(error)
              }
            
           }
        }
    }
    
    func login(username:String,password:String,currentViewController:UIViewController,context:UIView) -> Promise<LoginResponse> {
        let postString  = ["username": username,"password": password] as [String:Any]
        return Promise { seal -> Void in
            loadingPopUp = UIViewController.displayPopUpLoading(baseView:(context))
            Alamofire.request(LOGIN_URL, method: .post, parameters: postString,encoding: URLEncoding.default)
                .validate()
                .responseString(encoding:String.Encoding.utf8){ response in
                    
                    switch response.result {
                    case .success(let responseString):
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                            UIViewController.removePopUpLoading(spinner: self.loadingPopUp)
                            let loginResponse = LoginResponse(JSONString: "\(responseString)")
                            print(loginResponse!)
                            seal.fulfill(loginResponse!)
                        }
                        
                    case .failure(let error):
                        if let httpStatusCode = response.response?.statusCode {
                            if httpStatusCode == 401 {
                                print("401")
                            }
                        }
                        seal.reject(error)
                    }
                    
            }
        }
    }
    func getRemainders(currentViewController:UIViewController,context:UIView) -> Promise<RemainderResponse> {
        sessionManager.adapter = BitabakApiClient()
        return Promise { seal -> Void in
            sessionManager.request(REMAINDER_URL, method: .get,encoding: URLEncoding.default)
                .validate()
                .responseString(encoding:String.Encoding.utf8){ response in
                    
                    switch response.result {
                    case .success(let responseString):
                            let remainderResponse = RemainderResponse(JSONString: "\(responseString)")
                            print(remainderResponse!)
                            seal.fulfill(remainderResponse!)
                        
                    case .failure(let error):
                        if let httpStatusCode = response.response?.statusCode {
                            print(httpStatusCode)
                            if httpStatusCode == 401 {
                                print("401")
                            }
                        }
                        seal.reject(error)
                    }
                    
            }
        }
    }
}
