//
//  BaseViewController.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController{
     var isLeftTabbuttonHidden:Bool? = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        _ = self.navigationController?.navigationBar
        let titleImageView:UIImageView!
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 220, height: 120))
        titleImageView = UIImageView(image: UIImage(named: "nevermiss"))
        titleImageView.contentMode = .scaleAspectFit
        titleImageView.frame = CGRect(x: 0, y: -40, width: titleView.frame.width, height: titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
        let leftButtonView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let leftButton: UIButton = UIButton (type: UIButton.ButtonType.custom)
        leftButton.setImage(UIImage(named: "logout"), for: .normal)
        leftButton.contentMode = .scaleAspectFit
        leftButton.clipsToBounds = true
        leftButton.addTarget(self, action:  #selector(self.logOutButtonTap), for: UIControl.Event.touchUpInside)
        leftButton.frame = CGRect(x: 0, y: 0, width: leftButtonView.frame.width, height: leftButtonView.frame.height)
        leftButtonView.addSubview(leftButton)
        let leftbarButton = UIBarButtonItem(customView: leftButtonView)
        
        if isLeftTabbuttonHidden == false{
            self.navigationItem.leftBarButtonItem = leftbarButton
        }
        
    }
    
    @objc func logOutButtonTap(){
        let alert = UIAlertController(title: "Alert", message: "Are you sure your want to logout?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Logout", style: .default, handler: { action in
            switch action.style{
            case .default:
                self.sharedInstance().logout()
                print("sa")
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
            }}))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                self.dismiss(animated: true, completion: nil)
                
            case .destructive:
                print("destructive")
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
 
    func sharedInstance() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension UIViewController {
    func setupBackButton() {
        let customBackButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = customBackButton
    }}
