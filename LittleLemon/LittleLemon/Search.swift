//
//  Search.swift
//  LittleLemon
//
//  Created by Andrew Webster on 10/12/2023.
//

import SwiftUI

struct Search: View {
    @Binding var showSearch: Bool
    @Binding var searchText: String
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .frame(height: 85)
                .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
            HStack(alignment: .top) {
                Button(action: {
                    withAnimation {
                        showSearch.toggle()
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .padding()
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(50)
                })
                
                GeometryReader { geometry in
                    TextField("Search menu", text: $searchText)
                        .opacity(showSearch ? 1 : 0)
                        .frame(width: showSearch ? geometry.size.width : 0)
                        .animation(.easeInOut(duration: 0.5), value: showSearch)
                        .textFieldStyle(RoundedTextFieldStyle())
                }.frame(height: 55)
            }.padding()
      
        }

    }

}

#Preview {
    Search(showSearch: .constant(false), searchText: .constant(""))
}
