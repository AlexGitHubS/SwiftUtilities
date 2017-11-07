//  TrackableView.swift
//  Created by Alex on 2017-09-05.
//  Copyright © 2017 Alex Kozachenko. All rights reserved.

import Cocoa

protocol Trackable {
    var trackingArea : NSTrackingArea?
}

class TrackableView: NSView, Trackable {
    

    override func updateTrackingAreas() {
        if trackingArea != nil {
        self.removeTrackingArea(trackingArea!)
    }
    let options : NSTrackingAreaOptions = [.activeWhenFirstResponder, .mouseMoved ]
    
        trackingArea = NSTrackingArea(rect: self.bounds, options: options, owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea!)
    }
    
    override func mouseMoved(with event: NSEvent) {
        Swift.print("Mouse moved: \(event)")
    }

}
