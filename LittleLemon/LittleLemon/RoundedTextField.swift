//
//  RoundedTextField.swift
//  LittleLemon
//
//  Created by Andrew Webster on 03/12/2023.
//

import Foundation
import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical)
            .padding(.horizontal, 24)
            .background(
                Color(UIColor.white)
            )
            .clipShape(Capsule(style: .continuous))
    }
}
