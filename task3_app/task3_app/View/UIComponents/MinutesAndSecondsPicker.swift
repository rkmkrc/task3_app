//
//  MinutesAndSecondsPicker.swift
//  task3_app
//
//  Created by Erkam Karaca on 1.09.2023.
//

import SwiftUI

struct MinutesAndSecondsPicker: View {
    @Binding var minutes: Int
    @Binding var seconds: Int
    @Binding var isPickerEnabled: Bool
    
    var body: some View {
        HStack {
            Picker("Minutes", selection: $minutes) {
                ForEach(0..<60) { minute in
                    Text("\(minute) min")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(maxWidth: 200, maxHeight: 100)
            .disabled(!isPickerEnabled)
            
            Picker("Seconds", selection: $seconds) {
                ForEach(0..<60) { second in
                    Text("\(second) sec")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(maxWidth: 200, maxHeight: 100)
            .disabled(!isPickerEnabled)
        }
            .padding()
    }
}
