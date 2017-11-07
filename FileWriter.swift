//
//  FileWriter.swift
//  TTC Tracker
//
//  Created by Alex on 2017-10-29.
//  Copyright © 2017 Alex Kozachenko. All rights reserved.
//

import Foundation


class FileWriter {
    static func write(string: String, toUrl: URL) throws {
        do {
            try string.write(to: toUrl, atomically: true, encoding: .utf8)
        } catch {
            throw error // print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
    }
    
}
