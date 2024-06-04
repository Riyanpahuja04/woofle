//
//  goalInputScreen.swift
//  woofle
//
//  Created by James Handley on 4/6/2024.
//

import SwiftUI

struct goalInputScreen: View {
    
    @State private var userInputText: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                Image(systemName: "questionmark.circle")
                    .scaledToFit()
                    .font(.largeTitle)
                    .padding(.horizontal, 30)
            }
            
            Image("PLACEHOLDER_Woofle")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 64)
            
            Text("What is your Goal?")
                .font(
            Font.custom("SF Pro", size: 24)
            .weight(.semibold))
                .padding(.vertical, 15)
            
            HStack {
            
                Spacer(minLength: 75)
                    
                
                TextField("Please type in your goal...", text: $userInputText)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(4, reservesSpace: true)
                
                
                
                
                Image(systemName: "dice.fill")
                    .scaledToFit()
                    .font(.title)
                    .padding(.trailing, 30.0)
                
                
            }
            
            
            Rectangle()
            
            Button("Submit")
            {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding()

                
        }
        
    }
}

#Preview {
    goalInputScreen()
}
