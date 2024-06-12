//
//  pastCompletionScreen.swift
//  woofle
//
//  Created by Megan Nguyen on 12/6/2024.
//

import SwiftUI

private let _titleColor = Color(red: 0.28, green: 0.29, blue: 0.43)
private let _subTitleColor = Color(red: 1, green: 0.99, blue: 0.95)
private let _captionColor = Color(red: 0.09, green: 0.09, blue: 0.09)
private let _linkColor = Color(red: 0.43, green: 0.6, blue: 0.59)
private let _subSubTitleColor = Color(red: 0.16, green: 0.16, blue: 0.22)
private let _backgroundColor = Color(red: 1, green: 0.99, blue: 0.97)

struct pastCompletionScreen: View {
        let images = ["anxious", "sad", "happy", "content", "neutral"]
        let caption = ["anxious", "sad", "happy", "content", "neutral"]
        @State private var scrollOffset: CGFloat = 0
        @State private var initialOffsetSet = false

        @State private var selectedImageData: Data? = nil
        
        var body: some View {
            ScrollView {
            
                ZStack {
                    Color(_backgroundColor)
                        
                    Image("TopBgActivity")
                        .resizable()
                        .offset(y:-100)
        
                    
                    VStack(spacing: 5) {

                        ZStack {
                            Image("pawprint")
                                .resizable()
                                .rotationEffect(Angle(degrees: 32.42))
                                .frame(width: 138, height: 133)
                                .offset(x:150, y:-20)
                           
                            VStack(alignment:.leading, spacing: 7) {
                               
                                
                                Text("Playing “Stand By Me” Using Basic Chords On Guitar")
                                    .font(.system(size: 20))
                                    .fontWeight(.medium)
                                    .foregroundStyle(_subTitleColor)
                                
                                Text("Completed Levels")
                                    .font(.system(size: 35))
                                    .fontWeight(.semibold)
                                    .foregroundColor(_titleColor)
                                
                            }
                            .frame(width: 320)
                            
                        }
                        

                        Rectangle()
                          .fill(.clear)
                          .frame(height:20)
                        
                        VStack (alignment: .leading) {
                            HStack {
                                Image("filler-image")
                                    .resizable()
                                    .frame(width:50, height:50)
                            
                            VStack (alignment: .leading) {
                                Text("Level 1")
                                    .font(Font.custom("Darumadrop One", size: 30))
                                    .foregroundColor(.backgroundGreen)
                                HStack {
                                    Text("Learn Basic Chords")
                                        .font(.subheadline)
                                        .foregroundColor(_subSubTitleColor)
                                    Spacer()
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(_subSubTitleColor)
                                       
        
                                }
                            }
                        }
                            .padding()

 
                    
                            
                            Spacer()
                            
                                                        
                        

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        

                        .padding(.bottom, 30)
                        .padding(.top, 30)
                        .frame(height: 450)
                        
                        


                        
                        Spacer()
                    }
                    .safeAreaPadding(.top, 68)
                }
                .ignoresSafeArea()
            }
            .ignoresSafeArea()
    }

    
    }


#Preview {
    pastCompletionScreen()
}
