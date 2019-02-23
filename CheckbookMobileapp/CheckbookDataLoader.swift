//
//  CheckbookDataLoader.swift
//  CheckbookMobileapp
//
//  Created by Varun on 2/23/19.
//  Copyright © 2019 Varun Tandon. All rights reserved.
//

import Foundation
import OAuth2


/*
 Simple class handling authorization and data requests with Checkbook.
 */
class CheckbookDataLoader: OAuth2DataLoader {
    
    let baseURL = URL(string: "https://sandbox.checkbook.io")!
    let keys = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Keys", ofType: "plist") ?? "")

    
    public init() {
        let oauth = OAuth2CodeGrant(settings: [
            "client_id": keys!["client_id"],
            "client_secret": keys!["client_secret"],
            "authorize_uri": "https://sandbox.checkbook.io/oauth/authorize",
            "token_uri": "https://sandbox.checkbook.io/oauth/token",
            "scope": "check",
            "redirect_uris": ["checkbookoauthapp://oauth/callback"],
            ])
        oauth.authConfig.authorizeEmbedded = true
        oauth.logger = OAuth2DebugLogger(.trace)
        super.init(oauth2: oauth)
        alsoIntercept403 = true
    }
    
    /* Perform a request against the API and return decoded JSON or an Error. */
    func request(path: String, callback: @escaping ((OAuth2JSON?, Error?) -> Void)) {
        let url = baseURL.appendingPathComponent(path)
        let req = oauth2.request(forURL: url)
        
        perform(request: req) { response in
            do {
                let dict = try response.responseJSON()
                if response.response.statusCode < 400 {
                    DispatchQueue.main.async() {
                        callback(dict, nil)
                    }
                }
                else {
                    DispatchQueue.main.async() {
                        callback(nil, OAuth2Error.generic("\(response.response.statusCode)"))
                    }
                }
            }
            catch let error {
                DispatchQueue.main.async() {
                    callback(nil, error)
                }
            }
        }
    }
    
    func requestUserdata(callback: @escaping ((_ dict: OAuth2JSON?, _ error: Error?) -> Void)) {
        request(path: "/v3/check", callback: callback)
    }
}
