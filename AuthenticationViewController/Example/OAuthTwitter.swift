//
//  OAuthTwitter.swift
//  Example
//
//  Created by Andrei Momot on 12/4/17.
//  Copyright © 2017 Raul Riera. All rights reserved.
//

import Foundation
import AuthenticationViewController

struct OAuthTwitter: AuthenticationProvider {
    
    let title: String?
    let clientId: String
    let clientSecret: String
    let scopes: [String]
    
    let redirectURI = "http://127.0.0.1"
    var requestTokenURL: URL {
        return URL(string: "https://api.twitter.com/oauth/request_token")!
    }
    
    var authorizationURL: URL {
        // POST - https://api.twitter.com/oauth/request_token&oauth_callback/OAuthUniversal/oauth_consumer_key=\(clientId)
        // POST - https://api.twitter.com/oauth/authenticate?oauth_token=\(token)
        // POST - https://api.twitter.com/oauth/access_token
        
//        return URL(string: "https://api.twitter.com/oauth/request_token&oauth_callback/OAuthUniversal/oauth_consumer_key=\(clientId)")!
        return URL(string: "https://api.twitter.com/oauth/authenticate/?client_id=\(clientId)&scope=\(scopes.joined(separator: "+"))&redirect_uri=\(redirectURI)&response_type=token")!
        
    }
    
    var accessTokenURL: URL {
        return URL(string: "https://api.twitter.com/oauth/access_token")!
    }
    

    
    var parameters: [String: String] {
        return ["grant_type": "authorization_code", "redirect_uri": redirectURI]
    }
    
    // MARK: Initialisers
    
    init(clientId: String, clientSecret: String, scopes: [String]) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.scopes = scopes
        self.title = "Twitter"
    }
}
