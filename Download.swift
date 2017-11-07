//  Download.swift
//  Created by Alex on 12/18/16.
//  Copyright © 2016 Alex Kozachenko. All rights reserved.

import Foundation

class Download: NSObject {
    
     var url: String
     var isDownloading = false
     var progress: Float = 0.0
    
     var downloadTask: URLSessionTask?
     var data: Data?
    
     init(url: String) {
        self.url = url
    }
}

///A class to carry downloads on a concurent thread. Can download more than 1 download.
class Downloader: NSObject, URLSessionDownloadDelegate {
    
     private var configuration: URLSessionConfiguration!
     private var session: URLSession!
    
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
