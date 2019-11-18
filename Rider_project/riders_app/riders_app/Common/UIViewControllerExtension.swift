//
//  UIViewController+Storyboard.swift
//  riders_app
//
//  Created by admin on 8/31/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit


extension UIViewController
{
    class func instantiateFromStoryboard(storyboardName: String, storyboardId: String) -> Self
    {
        
        return instantiateFromStoryboardHelper(storyboardName: storyboardName, storyboardId: storyboardId)
    }
    
    private class func instantiateFromStoryboardHelper<T>(storyboardName: String, storyboardId: String) -> T
    {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        return controller
    }
}



extension UIViewController {
    class func displaySpinner(onView : UIView?) -> UIView {
        let spinnerView = UIView.init(frame: (onView?.bounds)!)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .white)
        ai.color = .orange
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView?.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}

extension UIViewController {
    
    func showAlert(title: String, message: String, callback: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
            alertAction in
            callback()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}


