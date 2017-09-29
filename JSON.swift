//  JSON.swift
//  Created by Alex on 2017-09-02.
//  Copyright © 2017 Alex Kozachenko. All rights reserved.

import Foundation


extension JSONSerialization {
    enum PasrsingError: Error {
        case keyNotFound
    }
    
    static func extractJson(fromJsonData jsonData: Data) -> NSDictionary? {
        do {
            guard let json = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                return nil
            }
            return json
        } catch let error  {
            print(error)
            return nil
        }
    }
}
