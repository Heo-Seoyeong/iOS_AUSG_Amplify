//
//  ViewController.swift
//  iosAmplify
//
//  Created by Seoyeong Heo on 2019/07/10.
//  Copyright © 2019 IosAmplify. All rights reserved.
//

import UIKit

import AWSAuthCore
import AWSAuthUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.showSignIn()
    }

    func showSignIn() {
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            if let naviController = self.navigationController {
                AWSAuthUIViewController.presentViewController(with: naviController, configuration: nil, completionHandler: { (provider: AWSSignInProvider, error: Error?) in
                    if error != nil {
                        print("Error occured: \(String(describing: error))")
                    }else{
                        print("Logged in with provider: \(provider.identityProviderName) with Token: \(provider.token())")
                    }
                })
            }
        }
    }
    
}

