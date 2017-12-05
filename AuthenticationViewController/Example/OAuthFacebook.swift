//
//  OAuthFacebook.swift
//  Example
//
//  Created by Andrei Momot on 12/4/17.
//  Copyright © 2017 Raul Riera. All rights reserved.
//

import Foundation
import AuthenticationViewController

struct OAuthFacebook: AuthenticationProvider {
    
    let title: String?
    let clientId: String
    let clientSecret: String
    let scopes: [String]
    
    let redirectURI = "https://www.facebook.com/connect/login_success.html" 
    
    var authorizationURL: URL {
        return URL(string: "https://api.facebook.com/dialog/oauth/?client_id=\(clientId)&scope=\(scopes.joined(separator: "+"))&redirect_uri=\(redirectURI)&response_type=token")!
    }
    
    var accessTokenURL: URL {
        return URL(string: "https://graph.facebook.com/oauth/access_token")!
    }
    
    var parameters: [String: String] {
        return ["grant_type": "authorization_code", "redirect_uri": redirectURI]
    }
    
    // MARK: Initialisers
    
    init(clientId: String, clientSecret: String, scopes: [String]) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.scopes = scopes
        self.title = "Facebook"
    }
}
