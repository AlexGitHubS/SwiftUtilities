//
//  ArrayExtensions.swift
//  TTC Tracker
//
//  Created by Alex on 2017-10-29.
//  Copyright © 2017 Alex Kozachenko. All rights reserved.
//

import Foundation

extension Array where Element: Equatable  {
    func stringify() -> [String]{
        return self.map( {return "\($0)"})
    }
}
