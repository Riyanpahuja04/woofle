//
//  WoofleButton.swift
//  woofle
//
//  Created by Riyan Pahuja on 5/6/2024.
//

import SwiftUI

struct WoofleActionButton: View {
    var text: String
    var vPad: CGFloat = 14
    var hPad: CGFloat = 25
    var action: () -> Void
    
    private let _buttonTextColor = Color(red: 0.15, green: 0.16, blue: 0.21)
    private let _buttonBgColor = Color(red: 1, green: 0.62, blue: 0.29)
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(
                    Font.system(size: 16)
                )
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, vPad)
                .padding(.horizontal, hPad)
                .background(_buttonBgColor)
                .foregroundStyle(_buttonTextColor)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.05), radius: 1, x: 0, y: 1)
        .padding(.horizontal, 25)
    }
}

#Preview {
    WoofleActionButton(text: "Add Text Here", action: {})
}
