//
//  CountdownViewModel.swift
//  task3_app
//
//  Created by Erkam Karaca on 1.09.2023.
//

import Foundation
class CountdownViewModel: ObservableObject {
    static let shared = CountdownViewModel()

    @Published var remainingTime: TimeInterval = 0
    private var timer: Timer?

    private init() {
        // Private initializer to ensure this class remains a singleton.
    }

    func startTimer(withDuration duration: TimeInterval) {
        stopTimer()
        remainingTime = duration
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.stopTimer()
            }
        }
    }
    
    func setTimer(withDuration duration: TimeInterval) {
        remainingTime = duration
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func formattedTime() -> String {
        let minutes = Int(remainingTime) / 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
