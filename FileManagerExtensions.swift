//
//  FileManager Extensions.swift
//  xCurrency
//
//  Created by Alex on 1/11/17.
//  Copyright © 2017 Alex Kozachenko. All rights reserved.
//

import Foundation


extension FileManager {
    static func LoadFile(fileName name: String, withExtension fileExtension: String, inDirectory: FileManager.SearchPathDirectory, domainMask: FileManager.SearchPathDomainMask = .userDomainMask) -> URL?{
        var fileName = ""
        fileExtension == "" ? (fileName = name) : (fileName = (name + "." + fileExtension))
        
        let fileManager = FileManager.default
        
        let docURL = fileManager.urls(for: inDirectory, in: domainMask).first!
        let fileURL = docURL.appendingPathComponent(fileName)
        print(fileURL)
        
        //file doesn't exist
        if (!fileManager.fileExists(atPath: fileURL.path)) {
            return nil
        }
            //file exists
        else {
            return fileURL
        }
    }
	static func documentDirectoryURL() -> URL {
		return FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first!
	}
}
