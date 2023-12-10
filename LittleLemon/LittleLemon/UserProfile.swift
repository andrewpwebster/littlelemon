//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Andrew Webster on 29/11/2023.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    let isLoggedIn = defaults.bool(forKey: kIsLoggedIn)
    let firstName = defaults.string(forKey: kFirstName) ?? "No first name"
    let lastName = defaults.string(forKey: kLastName) ?? "No last name"
    let email = defaults.string(forKey: kEmail) ?? "No email"
    let telephone = defaults.string(forKey: kTelephone) ?? "No telephone"
    
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
            Text(firstName)
            Text(lastName)
            Text(email)
            Text(telephone)
            Button("Logout") {
                defaults.removeObject(forKey: kIsLoggedIn)
                defaults.removeObject(forKey: kFirstName)
                defaults.removeObject(forKey: kLastName)
                defaults.removeObject(forKey: kEmail)
                defaults.removeObject(forKey: kTelephone)
                defaults.removeObject(forKey: kOrder)
                defaults.removeObject(forKey: kNewsletter)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }.padding()
            .toolbar {
            ToolbarItem(placement: .principal) {
                Header()
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserProfile()
}
