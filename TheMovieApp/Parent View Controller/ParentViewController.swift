//
//  ParentViewController.swift
//  NY Times MPA
//
//  Created by Mohammed Saleh on 6/13/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit
import Reachability
import NVActivityIndicatorView

class ParentViewController: UIViewController {

    var activityIndicatorView:NVActivityIndicatorView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createLoader()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(true)
    }
    
    func showAlert(title: String?, message: String?, shouldpop: Bool) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.blue
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
            
            if shouldpop
            {
                if let navController = self.navigationController
                {
                    navController.popViewController(animated: true)
                }
                else
                {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true)
    }
    
    func showLoader() {
        activityIndicatorView.startAnimating()
    }
    
    func hideLoader() {
        activityIndicatorView.stopAnimating()
    }
    
    func showConfirmationAlert(title: String?, message: String?, confirmCompletion: (() -> Void)?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.blue
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
            
            if confirmCompletion != nil
            {
                confirmCompletion!()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    private func createLoader(){
        let height = CGFloat(50)
        let width = CGFloat(50)
        let x = (self.view.frame.width / 2) - width / 2
        let y = (self.view.frame.height / 2) - 140
        let frame = CGRect(x: x, y: y, width: width, height: height)
        activityIndicatorView = NVActivityIndicatorView(frame: frame, type: .ballClipRotatePulse, color: UIColor(red: 0.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1), padding: 0)
        self.view.addSubview(activityIndicatorView)
    }
}
