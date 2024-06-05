//
//  WoofleButton.swift
//  woofle
//
//  Created by Riyan Pahuja on 5/6/2024.
//

import SwiftUI

struct WoofleActionButton: View {
    var text: String
    var action: () -> Void
    
    private let _buttonColor = Color(red: 0.15, green: 0.16, blue: 0.21)
    
    var body: some View {
        Button(action: action) {
            Text("Submit")
                .font(
                    Font.system(size: 16)
                )
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .padding(.horizontal, 25)
                .background(Color(red: 1, green: 0.62, blue: 0.29))
                .foregroundStyle(_buttonColor)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.05), radius: 1, x: 0, y: 1)
        .padding(.horizontal, 25)
    }
}

#Preview {
    WoofleActionButton(text: "Add Text Here", action: {})
}
