//
//  Header.swift
//  LittleLemon
//
//  Created by Andrew Webster on 09/12/2023.
//

import SwiftUI

struct Header: View {
    let isLoggedIn = defaults.bool(forKey: kIsLoggedIn)

    var body: some View {
        HStack {
            Image("logo").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 30)
        }.background(.white)
    }
}

#Preview {
    Header()
}
