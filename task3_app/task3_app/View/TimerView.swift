//
//  TimerView.swift
//  task3_app
//
//  Created by Erkam Karaca on 1.09.2023.
//

import Foundation
import SwiftUI

struct TimerView: View {
    @Environment(\.scenePhase) var scenePhase
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var isPickerEnabled = true
    @State private var isButtonInPlayMode = true
    @State private var isButtonInSetMode = true
    @State private var isCountdownSet = false
    
    var body: some View {
        VStack {
            MinutesAndSecondsPicker(minutes: $minutes, seconds: $seconds, isPickerEnabled: $isPickerEnabled)
            CountdownView(countdownViewModel: CountdownViewModel.shared)
            PlayAndResetButtonGroup(minutes: $minutes, seconds: $seconds, isPickerEnabled: $isPickerEnabled, isButtonInPlayMode: $isButtonInPlayMode, isButtonInSetMode: $isButtonInSetMode, isCountdownSet: $isCountdownSet)
        }
        .padding()
        .onChange(of: scenePhase) { newPhase in
            let remainingTime = CountdownViewModel.shared.remainingTime
            if newPhase == .inactive && !isButtonInPlayMode && remainingTime != 0 {
                if NotificationViewModel.permissionGranted {
                    NotificationViewModel.shared.scheduleNotification(title: "Timer App", body: "Timer has elapsed.", remainingTime: remainingTime)
                } else {
                    processCustomError(error: CustomError.permissionRequiredError)
                }
            }
        }
    }
}

