//
//  MapView.swift
//  woofle
//
//  Created by Megan Nguyen on 5/6/2024.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        ZStack(alignment: .top) {
            // Background color
            Color(red: 1, green: 0.99, blue: 0.95)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                Rectangle()
                    .fill(Color(red: 0.43, green: 0.60, blue: 0.59))
                    .frame(height: 543)
            }
            .frame(maxWidth: .infinity)
            
            Image("scenery")
                .offset(y:316)
            Image("rocks")
                .offset(y:490)
            
        }
        .ignoresSafeArea()
    }
}


#Preview {
    MapView()
}
