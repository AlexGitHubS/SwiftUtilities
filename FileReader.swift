//  FileReader.swift
//  Created by Alex on 2017-10-29.
//  Copyright © 2017 Alex Kozachenko. All rights reserved.

import Foundation

class NSFileRead {
    static func read(from:URL) throws -> String {
        do {
            let inString = try String(contentsOf: from)
            return inString
        } catch {
            throw error
        }
    }
}
