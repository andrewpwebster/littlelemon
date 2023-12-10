//
//  Home.swift
//  LittleLemon
//
//  Created by Andrew Webster on 29/11/2023.
//

import SwiftUI
let kFirstName = "first_name"
let kLastName = "last_name"
let kEmail = "email"
let kTelephone = "telephone"
let kNewsletter = "newsletter"
let kOrder = "order"
let kIsLoggedIn = "logged_in"
let kStep = "step"

let defaults = UserDefaults.standard

struct Home: View {
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Header()
                }
                ToolbarItem(placement: .primaryAction) {
                    
                    Image("profile-image-placeholder")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fit)
                    
                }
            }.navigationBarTitleDisplayMode(.inline) .toolbarBackground(.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    Home()
}
