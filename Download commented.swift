//  Download.swift
//  Created by Alex on 12/18/16.
//  Copyright © 2016 Alex Kozachenko. All rights reserved.

import Foundation

class Download: NSObject {
    
     var url: String
     var isDownloading = false
     var progress: Float = 0.0
    
    /*:
     The workhorses of `URLSession` are `URLSessionTask` and its concrete subclasses. T
     he subclasses you will interact with most are:
        - `URLSessionDataTask` for **fetching** data
        - `URLSessionUploadTask` for **uploading** data
        - `URLSessionDownloadTask` for **downloading** data
     
     `URLSessionDataTask` and `URLSessionDownloadTask` directly inherit from `URLSessionTask`.
     `URLSessionUploadTask` is a subclass of `URLSessionDataTask`.
     
     A `URLSessionTask` object is always associated with a session. 
     You can create a `URLSessionTask` object by asking the session for one.
     */
     var downloadTask: URLSessionTask?
     var data: Data?
    
     init(url: String) {
        self.url = url
    }
}

///A class to carry downloads on a concurent thread. Can download more than 1 download.
class Downloader: NSObject, URLSessionDownloadDelegate {
    
    /*:
     The `URLSession` family includes a number of key classes. 
     The `URLSession` class is the central component of the `URLSession` stack. It is used to create and configure network requests.
     The session is in charge of managing requests.
     
     session.shared - This returns a shared session object, a singleton, that uses the global cache, cookie storage, and credential storage.
     */
     private var session: URLSession!
    
    /*:
     Another important class is `URLSessionConfiguration`. 
     A session configuration object is used to **configure** a `URLSession` instance. 
     The session configuration defines the behavior of the session. 
     This is especially interesting for uploading and downloading data.
     */
    private var configuration: URLSessionConfiguration!
    
    //Store all active downloads
     var activeDownloads: [String:Download] = [:]
    
     init(configuration: URLSessionConfiguration = URLSessionConfiguration.default) {
        super.init()
        self.configuration = configuration
        self.session = URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue.main)
    }
    
    func StartDownloadingData(download: Download, completion: @escaping () -> ()) {
        let rqst = URLRequest(url: URL(string: download.url)!)
        download.downloadTask = session.dataTask(with: rqst, completionHandler: { (data, response, error) in
            print("Downloader:: task completed")
            if (error != nil) {
                print(error!.localizedDescription)
            } else {
                print("no error")
                download.data = data
                completion()
            }
        })
    }
    
    func StartDownloadingFile(download: Download) {
        download.downloadTask = session.downloadTask(with: URL(string: download.url)!)
        print("StartDownloadingFile:: StartDownloadingFile")
        download.downloadTask!.resume()
        download.isDownloading = true
        self.activeDownloads[download.url] = download
    }
    
    //MARK: NSURLSessionDownloadDelegate methods
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("NSURLSessionDownloadDelegate::urlSession didFinishDownloadingTo")
        if let originalURL = downloadTask.originalRequest?.url?.absoluteString {
            print("originalURL: \(originalURL)")
            do {
                let attr:NSDictionary? = try FileManager.default.attributesOfItem(atPath: originalURL) as NSDictionary?
                if let _attr = attr {
                    let fileSize = _attr.fileSize()
                    print("fileSize: \(fileSize)")
                }
            } catch {
                print("error gettin file attrs: \(error)")
            }
            
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error != nil {
            print("completed with error: \(error)")
        }
    }
}
