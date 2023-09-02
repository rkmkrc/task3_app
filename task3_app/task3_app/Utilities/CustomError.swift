//
//  CustomError.swift
//  task3_app
//
//  Created by Erkam Karaca on 2.09.2023.
//

import Foundation

enum CustomError: Error {
    case permissionRequiredError
}

func processCustomError(error: CustomError) {
    switch error {
    case .permissionRequiredError:
        print("Notification couldn't scheduled: Permission required.")
    }
}
