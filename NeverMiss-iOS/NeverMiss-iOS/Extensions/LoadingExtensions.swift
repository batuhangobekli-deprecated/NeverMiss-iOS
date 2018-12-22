//
//  LoadingExtensions.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//


import Foundation
import UIKit
import NVActivityIndicatorView
import Kingfisher

// MARK: - ONSUCCESS LOADING SPINNER
extension UIViewController {
    class func displayLayoutLoading(onView : UIView,backgroundColor:UIColor? = .white) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = backgroundColor
        let nav = NVActivityIndicatorView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50), type: .ballClipRotate, color: colorOrange , padding: 0.0)
        nav.startAnimating()
        nav.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(nav)
            onView.addSubview(spinnerView)
        }
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}

public extension UIView{
    func fadeIn(withDuration duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    /// Fade out a view with a duration
    ///
    /// - Parameter duration: custom animation duration
    func fadeOut(withDuration duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
}

//MARK:Dialog LOADING
extension UIViewController {
    class func displayPopUpLoading(baseView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: baseView.bounds)
        spinnerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        let ai = NVActivityIndicatorView.init(frame: CGRect(x: 10, y: 10, width: 30, height: 30), type: NVActivityIndicatorType.circleStrokeSpin, color: colorOrange, padding: 0.0)
        
        ai.startAnimating()
        let label = UILabel(frame: CGRect(x:10,y: 10,width: 250,height: 50))
        
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Yükleniyor"
        
        let customView = UIView(frame: CGRect(x: 10, y: 10, width: 300, height: 120))
        customView.center = spinnerView.center
        
        label.center.y = customView.center.y
        label.center.x = customView.center.x
        ai.center.y = customView.center.y
        ai.center.x = customView.frame.minX + 40
        customView.backgroundColor = UIColor.white
        spinnerView.addSubview(customView)
        customView.addSubview(ai)
        spinnerView.bringSubviewToFront(ai)
        
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            spinnerView.addSubview(label)
            baseView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removePopUpLoading(spinner :UIView) {
        spinner.removeFromSuperview()
    }
}

//MARK:POPUP ERROR MESSAGE
extension UIViewController {
    class func displayMessages(baseView : UIView,errorMessage:String,iconImage:UIImage?) -> UIView {
        let spinnerView = UIView.init(frame: baseView.bounds)
        let popUpImage:UIImageView?
        
        spinnerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        button.backgroundColor = colorOrange
        button.setTitle("TAMAM", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        
        button.addTapGestureRecognizer {
            spinnerView.removeFromSuperview()
        }
        
        if let image = iconImage {
            popUpImage = UIImageView(image: image)
        }else {
            popUpImage = UIImageView(image: #imageLiteral(resourceName: "error"))
        }
        popUpImage?.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        popUpImage?.center.y = spinnerView.center.y - 20
        
        let label = UILabel(frame: CGRect(x:10,y: 10,width: 200,height: 65))
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(17)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.text = errorMessage
        
        let customView = UIView(frame: CGRect(x: 10, y: 10, width: 300, height: 120))
        customView.center = spinnerView.center
        label.center.y = customView.center.y - 20
        label.center.x = customView.center.x + 20
        popUpImage?.center.x = customView.frame.minX + 40
        button.center.x = customView.frame.midX
        button.center.y = spinnerView.center.y + 35
        
        customView.backgroundColor = UIColor.white
        spinnerView.addSubview(customView)
        customView.addSubview(popUpImage!)
        customView.addSubview(button)
        spinnerView.bringSubviewToFront(popUpImage!)
        
        DispatchQueue.main.async {
            spinnerView.addSubview(popUpImage!)
            spinnerView.addSubview(label)
            spinnerView.addSubview(button)
            baseView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeErrorMessages(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
            
        }
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UIView {
    
    // In order to create computed properties for extensions, we need a key to
    // store and access the stored property
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Every time the user taps on the UIImageView, this function gets called,
    // which triggers the closure we stored
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
    
}
