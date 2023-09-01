//
//  CountdownView.swift
//  task3_app
//
//  Created by Erkam Karaca on 1.09.2023.
//

import SwiftUI
struct CountdownView: View {
    @ObservedObject var countdownViewModel: CountdownViewModel

    var body: some View {
        Text(countdownViewModel.formattedTime())
            .font(.largeTitle)
    }
}

