//
//  ViewController.swift
//  Example
//
//  Created by Raúl Riera on 04/11/2015.
//  Copyright © 2015 Raul Riera. All rights reserved.
//

import UIKit
import AuthenticationViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapAuthenticate(_ sender: UIButton) {

        let provider = OAuthInstagram(clientId: "d4a8f1956a9144a784ba59ed0803a4e7", clientSecret: "8d5f12c0f4fc475c85a5b1fe52a6a539", scopes: ["public_content"])
        
        //        let provider = OAuthGoogle(clientId: "68328860856-6bld9p0bh603bi9n0nupdalqibpn1gcc.apps.googleusercontent.com", clientSecret: " ", scopes: ["profile"])
//        let provider = OAuthTwitter(clientId: "gw9nA9GcmXMVfUL1jYrJYYgaf", clientSecret: "UWuK8ZFIEoubmR2FsFaSgvkS2dtHlGue86vKgsyrlBq72sPfGH", scopes: ["public", "upload"])
        
        let authenticationViewController = AuthenticationViewController(provider: provider)
        
        authenticationViewController.failureHandler = { error in
            print(error)
        }
        
        authenticationViewController.authenticationHandler = { token in
            print("=====TOKEN", token)
            authenticationViewController.dismiss(animated: true, completion: nil)
        }
        
        present(authenticationViewController, animated: true, completion: nil)
    }
}
