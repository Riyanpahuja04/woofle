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
    
        @State var globalActivityTracker = GlobalActivityTracker.shared
    
        @State var data = globalSavedExperience.shared.savedExperienceArray
    
        
        
        var body: some View {
            
                ZStack {
                    Color(_backgroundColor)
                        
                    Image("TopBgActivity")
                        .resizable()
//                        .offset(y:-100)
        
                    
                    VStack(spacing: 5) {

                        ZStack {
                            Image("pawprint")
                                .resizable()
                                .rotationEffect(Angle(degrees: 32.42))
                                .frame(width: 138, height: 133)
                                .offset(x:150, y:-20)
                           
                            VStack(alignment:.leading, spacing: 7) {
                               
                                
                                Text(globalActivityTracker.currentGoal)
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
                        
                        ScrollView {
                            
                            ForEach(data) { data in
                                CompletedLevelButton(buttonData: data)
                                
                            }

 
                    
                            
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

    
    }


#Preview {
    pastCompletionScreen()
}
