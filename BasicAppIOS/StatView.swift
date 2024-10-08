//
//  StatView.swift
//  BasicAppIOS
//
//  Created by Emeric on 6/10/24.
//

import SwiftUI

struct StatView: View {
    let statName: String
    let value: Int
        
        var body: some View {
            HStack {
                Text("\(statName):")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Text("\(value)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(statName: "HP", value: 100)
    }
}
