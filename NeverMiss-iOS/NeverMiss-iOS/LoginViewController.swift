//
//  LoginViewController.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class LoginViewController: BaseViewController {

    @IBOutlet weak var passwordTextField: UITextField!
   
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func login (){
        let apiCall = APIManager().login(username: emailTextField.text!,password: passwordTextField.text!, currentViewController: self, context: self.view)
        apiCall.done {json in
            if let token = json.token {
                let tokenSaved: Bool = KeychainWrapper.standard.set(token, forKey: "token")
                if tokenSaved {
                    self.sharedInstance().navigateToMainPage()
                }
                
            }
            }.catch {error in
                //errorleri kontrol et
                debugPrint(error.localizedDescription)
        }
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        self.login()
    }
    

}
