//
//  OAuthGoogle.swift
//  Example
//
//  Created by Andrei Momot on 12/4/17.
//  Copyright © 2017 Raul Riera. All rights reserved.
//

import Foundation
import AuthenticationViewController

struct OAuthGoogle: AuthenticationProvider {
    
    let title: String?
    let clientId: String
    let clientSecret: String
    let scopes: [String]
    
    let redirectURI = "https://www.google.com"
    
    var authorizationURL: URL {
        return URL(string: "https://accounts.google.com/o/oauth2/auth/?client_id=\(clientId)&scope=\(scopes.joined(separator: "+"))&redirect_uri=\(redirectURI)&response_type=code")!
    }
    
    var accessTokenURL: URL {
        return URL(string: "https://accounts.google.com/o/oauth2/token")!
    }
    
    var parameters: [String: String] {
        return ["grant_type": "authorization_code"]
    }
    
    // MARK: Initialisers
    
    init(clientId: String, clientSecret: String, scopes: [String]) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.scopes = scopes
        self.title = "Google"
    }
}
