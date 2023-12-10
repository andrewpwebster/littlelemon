//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Andrew Webster on 29/11/2023.
//

import SwiftUI

struct Onboarding: View {
    @State private var step: Int = 1
    @State private var isLoggedIn : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoggedIn {
                    NavigationLink(destination: Home(), isActive: .constant(isLoggedIn == true)) {
                        EmptyView()
                    }.hidden()
                } else {
                    NavigationLink(destination: Step1(step: $step), isActive: .constant(isLoggedIn == false)) {
                        EmptyView()
                    }.hidden()
                }
                
                
                Spacer()
            }
        }
        .onAppear {
            if (defaults.bool(forKey: kIsLoggedIn)) {
                isLoggedIn = true
            } else {
                defaults.set(1, forKey: kStep)
            }
        }
        
        
    }
}


#Preview {
    Onboarding()
}
