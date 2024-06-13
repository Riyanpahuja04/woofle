//
//  CompletedLevelButton.swift
//  woofle
//
//  Created by James Handley on 13/6/2024.
//

import SwiftUI

struct CompletedLevelButton: View {
    
    @State private var canNavigate = false
    @State var buttonData: SavedExperience
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: (buttonData.image ?? UIImage(named: "pawprint")?.sd_imageData())!)!)
                .resizable()
                .frame(width:50, height:50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        
        VStack (alignment: .leading) {
            Text("Level \(buttonData.level)")
                .font(Font.custom("Darumadrop One", size: 30))
                .foregroundColor(.backgroundGreen)
            HStack {
                Text(buttonData.title)
                    .font(.subheadline)
                    .foregroundColor(_subSubTitleColor)
                Spacer()
                   

            }
        }
            Image(systemName: "arrow.right")
                .foregroundColor(_subSubTitleColor)
    }
        .onTapGesture {
            canNavigate = true
        }
        .padding()
        .navigationDestination(isPresented: $canNavigate) {
            reviewprogress(objectData: buttonData)
        }
    }
    
    private let _titleColor = Color(red: 0.28, green: 0.29, blue: 0.43)
    private let _subTitleColor = Color(red: 1, green: 0.99, blue: 0.95)
    private let _captionColor = Color(red: 0.09, green: 0.09, blue: 0.09)
    private let _linkColor = Color(red: 0.43, green: 0.6, blue: 0.59)
    private let _subSubTitleColor = Color(red: 0.16, green: 0.16, blue: 0.22)
    private let _backgroundColor = Color(red: 1, green: 0.99, blue: 0.97)
    
}

#Preview {
    CompletedLevelButton(buttonData: SavedExperience(level: 1, title: "Text", mood: 1, date: Date()))
}
