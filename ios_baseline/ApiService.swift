//
//  ApiService.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 5/6/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct ApiService {
    let tron = TRON(baseURL: "http://localhost:3000/api/v1")
    static let sharedInstance = ApiService()
    
    class JSONError: JSONDecodable {
        var errors: [String:[String]] = [:]
        required init(json: JSON) {
            if let dictionary = json["errors"].dictionary {
                for (key,value) in dictionary {
                    errors[key] = value.arrayValue.map( { return $0.stringValue } )
                }
            }
        }
    }
    
    class Token: JSONDecodable {
        let token: String
        required init(json: JSON) throws {
            self.token = json["user"]["auth_token"].stringValue
        }
    }
    
    func signIn(email: String, password: String) {
        let parameters: [String : Any] = [
            "session": [
                "email": email,
                "password": password
            ]
        ]
        let request: APIRequest<Token, JSONError> = tron.request("/sessions")
        request.method = .post
        request.parameters = parameters
        request.perform(withSuccess: { (tokenData) in
        }) { (error) in
            if let data = error.data {
                print(JSON(data: data))
            }
        }

    }

    
}
