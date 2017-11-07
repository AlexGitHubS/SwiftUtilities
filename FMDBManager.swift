//  DBManager.swift
//  Created by Oleksii Kozachenko on 2017-05-03.
//  Copyright © 2017 macuser. All rights reserved.

import Foundation

//MARK:- DBManager Class
class DBManager: FMDBManager {
    
    //MARK: Properties
    let databaseFileName: String
    let pathToDatabase: String
    
    //A FMDatabase object (from the FMDB library) that will be accessing and operating on the actual database.
    var database: FMDatabase!
    
    //MARK: Initialization
    init(dbFileName: String, inDirectory: URL) {
        self.databaseFileName = dbFileName
        pathToDatabase = inDirectory.appendingPathComponent(databaseFileName, isDirectory: false).absoluteString
    }
    
    func createDatabase() -> Bool {
        var created = false
        if !FileManager.default.fileExists(atPath: pathToDatabase) {
            database = FMDatabase(path: pathToDatabase)
            //is creating the database file specified by the initialiser’s argument, if only the file is not found (what we want here actually). No connection is being established at that point though. We just know that after that line we can use the database property to have access to our database.
            created = true
        }
        return created
    }
    /**
     Performs Any SQL statement _(delete, create, update)_
     - important:
     __Does not__ perform **select** statemtnts.
     - parameters:
        - withSQLQuery: SQL statement as a string.
     - returns:
     Bool, indicating the status of the performed operation. True if statement was run successfully, false otherwise.
     */
    func editTable(withSQLQuery query: String) -> Bool {
        var success = false
        if openDatabase() {
            do {
                try database.executeUpdate(query, values: nil)
                success = true
            }
            catch {
                print("Could not edit table:")
                print(error.localizedDescription)
                print(error)
            }
            // At the end close the database.
            database.close()
        }
        else {
            fatalError("Could not open the database.")
        }
        return success
    }
}
