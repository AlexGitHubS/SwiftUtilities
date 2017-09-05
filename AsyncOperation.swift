//  AsyncOperation.swift
//  Created by Alex on 2017-09-03.
//  Copyright © 2017 Alex Kozachenko. All rights reserved.

import Foundation

class AsynchronousOperation : Operation {
    enum State: String {
        case ready = "Ready"
        case executing = "Executing"
        case finished = "Finished"
        fileprivate var keyPath: String { return "is" + self.rawValue }
    }

    override var isAsynchronous: Bool { return true }
    override var isExecuting: Bool { return state == .executing }
    override var isFinished: Bool { return state == .finished }
    
    var state = State.ready {
        willSet {
            willChangeValue(forKey: state.keyPath)
            willChangeValue(forKey: newValue.keyPath)
        }
        didSet {
            didChangeValue(forKey: state.keyPath)
            didChangeValue(forKey: oldValue.keyPath)
        }
    }

    func finish() {
        state = .finished
    }
    func execute() {
        state = .executing
    }
    
}
