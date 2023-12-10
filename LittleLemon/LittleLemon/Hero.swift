//
//  Hero.swift
//  LittleLemon
//
//  Created by Andrew Webster on 09/12/2023.
//

import SwiftUI

struct Hero: View {
    @State private var searchText = ""
    @State private var showSearch: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon")
                .font(
                    .custom("MarkaziText-Medium", size: 36))
                .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Chicago")
                        .font(
                            .custom("MarkaziText-Medium", size: 24))
                        .foregroundColor(.white)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(
                            .custom("Karla-Regular", size: 16))
                        .foregroundColor(.white)
                }
                Spacer()
                Image("bruschetta")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
            }

        }
        .padding()
        .background(Color(red: 73/255, green: 94/255, blue: 87/255))
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    Hero()
}
