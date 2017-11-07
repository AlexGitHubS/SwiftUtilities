//  StringExtensions.swift
//  Created by Alex on 2017-09-28.
//  Copyright © 2017 Alex Kozachenko. All rights reserved.

import Cocoa

extension String {
    func size(OfFont font: NSFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedStringKey.font: font])
    }
    func size(withAttributes attrs: [NSAttributedStringKey : Any]) -> CGSize {
        return (self as NSString).size(withAttributes: attrs)
    }
}
