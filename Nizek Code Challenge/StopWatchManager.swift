//
//  StopWatchManager.swift
//  Nizek Code Challenge
//
//  Created by Hajir Javaheri on 7/16/1400 AP.
//

import SwiftUI

class StopWatchManager: ObservableObject {
    @Published var timeOut: Bool = false
    var timer: Timer = Timer()

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: false) { _ in
            self.timeOut = true
        }
    }

    func stop() {
        timer.invalidate()
        timeOut = false
    }

    func pause() {
        timer.invalidate()
    }
}
