//
//  CheckBox.swift
//  GenTest
//
//  Created by Danny Castro on 3/21/24.
//

import SwiftUI

struct Checkbox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                
                    .foregroundColor(configuration.isOn ? Color.accentColor : .secondary)
                configuration.label
            }
        }
    }
}
