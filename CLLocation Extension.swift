//
//  CLLocation Extension.swift
//  TTC Tracker
//
//  Created by Alex on 2017-11-05.
//  Copyright © 2017 Alex Kozachenko. All rights reserved.
//

import CoreLocation


extension CLLocationCoordinate2D: Hashable {
    public var hashValue: Int {
        get {
            return (latitude.hashValue&*397) &+ longitude.hashValue;
        }
    }
}

extension CLLocationCoordinate2D: Equatable {}

public func ==(lhs:CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return ( (lhs.longitude == rhs.longitude) && (lhs.latitude == rhs.latitude))
}
