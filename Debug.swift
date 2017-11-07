//  Debug.swift
//  Created by Alex on 2017-08-02.

import Foundation

/// Hide print statements for release. Can be used for every print statement in your project
struct Debug {
    static func print(_ object: Any) {
        #if DEBUG
            Swift.print("DEBUG", object, terminator: "")
        #endif
    }
}
