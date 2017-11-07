//  SetExtensions.swift
//  Created by Alex on 2017-10-29.
//  Copyright © 2017 Alex Kozachenko. All rights reserved.

import Foundation

extension Set where Element: Equatable {
    func stringify() -> [String] {
        var returnArray = [String]()
        returnArray = self.map { (e) in
            return "\(e)"
        }
        return returnArray
    }
}
