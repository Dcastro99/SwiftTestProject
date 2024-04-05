//
//  TimeFunction.swift
//  GenTest
//
//  Created by Danny Castro on 3/21/24.
//

import SwiftUI

func formatLongDate(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter.string(from: date)
}
func formatTime(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.timeStyle = .short
    return formatter.string(from: date)
    }
