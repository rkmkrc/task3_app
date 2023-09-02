//
//  PlayAndResetButtonGroup.swift
//  task3_app
//
//  Created by Erkam Karaca on 2.09.2023.
//

import SwiftUI

struct PlayAndResetButtonGroup: View {
    @Binding var minutes: Int
    @Binding var seconds: Int
    @Binding var isPickerEnabled: Bool
    @Binding var isButtonInPlayMode: Bool
    @Binding var isButtonInSetMode: Bool
    @Binding var isCountdownSet: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Button(action: {
                let remainingTime = CountdownViewModel.shared.remainingTime
                
                // Prevent to button change to pause when all 0.
                if minutes == 0 && seconds == 0 && remainingTime == 0 {
                    isButtonInPlayMode = true
                    return
                }
                // Start the timer.
                if isButtonInPlayMode && remainingTime == 0 && isCountdownSet {
                    let totalSeconds = minutes * 60 + seconds
                    CountdownViewModel.shared.startTimer(withDuration: TimeInterval(totalSeconds))
                    isButtonInPlayMode = false
                    isPickerEnabled = false
                }
                // Continue the paused counting down.
                else if isButtonInPlayMode && remainingTime != 0 {
                    CountdownViewModel.shared.startTimer(withDuration: CountdownViewModel.shared.remainingTime)
                    isButtonInPlayMode = false
                    isPickerEnabled = false
                }
                // Pause the timer.
                else {
                    CountdownViewModel.shared.stopTimer()
                    isButtonInPlayMode = true
                    isPickerEnabled = true
                }
                
                isButtonInSetMode = isButtonInPlayMode
            }) {
                Text(isButtonInPlayMode ? "Play" : "Pause")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                if isButtonInSetMode {
                    // Set time but not start to countdown
                    let totalSeconds = minutes * 60 + seconds
                    CountdownViewModel.shared.setTimer(withDuration: TimeInterval(totalSeconds))
                    isCountdownSet = true
                } else {
                    // Reset the timer
                    self.minutes = 0
                    self.seconds = 0
                    CountdownViewModel.shared.setTimer(withDuration: TimeInterval(0))
                    isPickerEnabled = true
                    isButtonInPlayMode = true
                    isButtonInSetMode = true
                    isCountdownSet = false
                }
            }) {
                Text("Set/Reset")
                    .font(.headline)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

