//
//  goalCompletionView.swift
//  woofle
//
//  Created by Megan Nguyen on 6/6/2024.
//

private let _titleColor = Color(red: 0.28, green: 0.29, blue: 0.43)
private let _subTitleColor = Color(red: 1, green: 0.99, blue: 0.95)
private let _captionColor = Color(red: 0.09, green: 0.09, blue: 0.09)
private let _linkColor = Color(red: 0.43, green: 0.6, blue: 0.59)
private let _subSubTitleColor = Color(red: 0.16, green: 0.16, blue: 0.22)
private let _backgroundColor = Color(red: 1, green: 0.99, blue: 0.97)



import SwiftUI
import SDWebImageSwiftUI
import PhotosUI

struct goalCompletionView: View {
    
    let images = ["anxious", "sad", "happy", "content", "neutral"]
    let caption = ["anxious", "sad", "happy", "content", "neutral"]
    @State private var scrollOffset: CGFloat = 0
    @State private var initialOffsetSet = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        //ScrollView {
        
            ZStack {
                Image("TopBgActivity")
                    .resizable()
    
                
                VStack(spacing: 5) {

                    ZStack {
                        Image("pawprint")
                            .resizable()
                            .rotationEffect(Angle(degrees: 32.42))
                            .frame(width: 138, height: 133)
                            .offset(x:150)
                       
                        VStack(alignment:.leading, spacing: 7) {
                           
                            Text("Playing “Stand By Me” Using Basic Chords On Guitar")
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                .foregroundStyle(_subTitleColor)
                            
                            
                            Text("Learn Basic\nChords")
                                .font(.system(size: 35))
                                .fontWeight(.semibold)
                                .foregroundColor(_titleColor)
                            
                        }
                        .frame(width: 320)
                        
                    }
                    

                    Rectangle()
                      .fill(.clear)
                      .frame(height:20)
                    
                    VStack {
                        Text("Share your experience!")
                            .font(.system(size: 20)
                            )
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(_subSubTitleColor)
                            .padding(.bottom,10)
                        
                        Group {
                            
                            PhotosPicker(
                                
                                selection: $selectedItem,
                                matching: .images,
                                photoLibrary: .shared()) {
                                    
                                    if let selectedImageData,
                                       let uiImage = UIImage(data: selectedImageData) {
                                        
                                            ZStack {
                                                Image(uiImage: uiImage)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(maxWidth: 280, maxHeight: 150)
                                                    .border(Color(red: 0.88, green: 0.88, blue: 0.89), width: 12)
                                                    .cornerRadius(15)
                                            }
                                        
                                    }
                                    
                                    else {
                                        
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 280, height: 142)
                                                .cornerRadius(15)
                                                .foregroundColor(Color(red: 0.88, green: 0.88, blue: 0.89))
                                            Image(systemName: "photo.badge.plus.fill")
                                                .font(.system(size: 20))
                                                .multilineTextAlignment(.center)
                                                .frame(width: 42, alignment: .top)
                                                .foregroundColor(_subSubTitleColor)
                                            
                                        }
                                        
                                    }
                                }
                                .onChange(of: selectedItem, { oldValue, newValue in
                                    Task {
                                        // Retrieve selected asset in the form of Data
                                        if let data = try? await newValue?.loadTransferable(type: Data.self) {
                                            selectedImageData = data
                                        }
                                    }
                                })
                        }
                        
                        Text("How do you feel?")
                            .font(.system(size: 20)
                            )
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(_subSubTitleColor)
                            .padding(.top,10)
                        
                        
                        ZStack {
                            
                            Circle()
                                .frame(width: 80)
                                .offset(y:-24)
                                .foregroundColor(.circleYellow)
 
                            GeometryReader { geometry in
                                ScrollView(.horizontal) {
                                    LazyHStack {
                                        ForEach(0..<images.count * 3, id: \.self) { index in
                                            let imageIndex = index % images.count
                                            VStack{
                                                Image(images[imageIndex])
                                                    //.resizable()
                                                    .frame(width: 100)
                                                Rectangle()
                                                    .frame(width: 1, height: 1)
                                                    .foregroundColor(.clear)
                                                Text("I'm feeling")
                                                
                                                Text(caption[imageIndex])
                                            }
                                            .padding(.leading, 20.0)
                                            .font(.system(size: 15)
                                            )
                                            .foregroundStyle(_titleColor)
                                        }
                                    }
                                    .scrollTargetLayout()
                                }
                                .scrollIndicators(.hidden)
                                .scrollTargetBehavior(.viewAligned)
                            }
                            
                            
                                
                            
                            
                            VStack {
                                HStack {
                                    Rectangle()
                                        .frame(width:100, height:.infinity)
                                        .foregroundColor(.clear)
                                        .overlay(
                                            LinearGradient(gradient: Gradient(colors: [_backgroundColor, .clear]), startPoint: .leading, endPoint: .trailing))
                                    Rectangle()
                                        .frame(width:180, height:.infinity)
                                        .foregroundColor(.clear)
                                    Rectangle()
                                        .frame(width:100, height:.infinity)
                                        .foregroundColor(.clear)
                                        .overlay(
                                            LinearGradient(gradient: Gradient(colors: [_backgroundColor, .clear]), startPoint: .trailing, endPoint: .leading))
                                    
                                }
                                //rectangle stack
                                HStack (spacing: 0) {
                                    Rectangle()
                                        .frame(width:130, height:50)
                                        .foregroundColor(_backgroundColor)
       
                                    Rectangle()
                                        .frame(width:30, height:50)
                                        .foregroundColor(.clear)
                                        .overlay(
                                            LinearGradient(gradient: Gradient(colors: [_backgroundColor, .clear]), startPoint: .leading, endPoint: .trailing))

                                    Rectangle()
                                        .frame(width:80, height:50)
                                        .foregroundColor(.clear)
   
       
                                    Rectangle()
                                        .frame(width:30, height:50)
                                        .foregroundColor(.clear)
                                        .overlay(
                                            LinearGradient(gradient: Gradient(colors: [_backgroundColor, .clear]), startPoint: .trailing, endPoint: .leading))
                                    
                                    
                                Rectangle()
                                    .frame(width:130, height:50)
                                    .foregroundColor(_backgroundColor)
                                    
                            }
                                
                            
                            }

                            
                        }
                        
                    

                        

                    }
                    
                    

                    .padding(.bottom, 30)
                    .padding(.top, 30)
                    .frame(height: 450)
                    
                    

                    
                    // TODO: Add tappable functionality
                    VStack {
                        Rectangle()
                            .frame(width: 1, height: 10)
                            .foregroundColor(.clear)
                        WoofleActionButton(text: "Submit", action: {})
                    }
                    
                    Spacer()
                }
                .safeAreaPadding(.top, 68)
            }
            .ignoresSafeArea()
        }
//        .ignoresSafeArea()
//}
}
    
    
    
    
    
    struct goalCompletionView_Previews: PreviewProvider {
        static var previews: some View {
            goalCompletionView()
        }
    }
    
    

