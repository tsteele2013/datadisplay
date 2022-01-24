//
//  Constants.swift
//  DataDisplay
//
//  Created by Trevor Steele on 1/24/22.
//

import Foundation

public struct Constants {
    static let positivePadding = 16.0
    static let negativePadding = -16.0
    static let headerHeight = 25.0
}

let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd, yyyy"
    return dateFormatter
}()
