//  FMDBManager Protocol.swift
//  Created by Alex on 2017-05-04.
//  Copyright © 2017 Alex Kozachenko. All rights reserved.

import Foundation

//MARK:- FMDBManager Protocol
@objc protocol FMDBManager {
    var database: FMDatabase! {get set}
    var pathToDatabase: String {get}
    func createDatabase() -> Bool
    
    @objc optional func editTable(withSQLQuery query: String) -> Bool
}
extension FMDBManager {
    ///If *database* is not nil it will open it using FMDB .open() method and returns true if succeeded.
    func openDatabase() -> Bool {
        if database != nil {
            if database.open() {
                return true
            }
        }
        return false
    }
}
