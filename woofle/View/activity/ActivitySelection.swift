import SwiftUI

struct ActivitySelection: View {
    @State private var selectedTask: String?
    @State private var isSpinning: Bool = false
    
    private let _titleColor = Color(red: 0.28, green: 0.29, blue: 0.43)
    private let _subTitleColor = Color(red: 1, green: 0.99, blue: 0.95)
    private let _captionColor = Color(red: 0.09, green: 0.09, blue: 0.09)
    private let _linkColor = Color(red: 0.43, green: 0.6, blue: 0.59)
    
    // TODO: fetch api data to show
    var body: some View {
            ScrollView {
                ZStack {
                    Image("TopBgActivity")
                        .resizable()
                        .scaledToFill()
                    
                    VStack(spacing: 5) {
                        // TODO: populate data from api
                        VStack(alignment:.leading, spacing: 7) {
                            Text("Playing “Stand By Me” Using Basic Chords On Guitar")
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                .foregroundStyle(_subTitleColor)
                            
                            
                            Text("What activity you want to do?")
                                .font(.system(size: 35))
                                .fontWeight(.semibold)
                                .foregroundColor(_titleColor)
                        }
                        .padding(.horizontal, 60)
                        
                        Spacer()
                        
                        VStack {
                            Text("LEVEL 0")
                                .font(.system(size: 24)
                                )
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(_titleColor)
                                .padding(.bottom, 30)
                            ForEach(_sample.indices, id: \.self) { index in
                                ActivitySelectionButton(
                                    task: _sample[index]["task"]!,
                                    description: _sample[index]["description"]!,
                                    selectedTask: $selectedTask
                                )
                            }
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 2) {
                            Text("Don’t like these options?")
                                .font(.system(size: 15))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(_captionColor)
                            
                            
                            Button(action: {
                                isSpinning.toggle()
                            }) {
                                HStack(spacing: 2) {
                                    Text("Refresh now")
                                        .font(Font.system(size: 15))
                                        .fontWeight(.medium)
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(_linkColor)
                                    
                                    Image(systemName: "arrow.triangle.2.circlepath")
                                        .foregroundStyle(_linkColor)
                                        .rotationEffect(.degrees(isSpinning ? 360 : 0))
                                        .animation(Animation.linear(duration: 1).repeatCount(1, autoreverses: false), value: isSpinning)
                                    
                                    
                                }
                                
                            }
                        }
                        .padding(.bottom, 30)
                        
                        // TODO: Add tappable functionality
                        WoofleActionButton(text: "Submit", action: {})
                        
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
    ActivitySelection()
}

// TODO: Delete this once API is ready
let _sample = [
    [
        "task": "Learn Basic Chords",
        "description": "The four most common guitar chords are E-Minor, C, G and D. Youtube Tutorials would be a good place to start!"
    ],
    [
        "task": "Learn the Song Structure",
        "description": "Learn the Song Structure: Identify verses, chorus, bridge. Online sources like Yousician might give you a best way to learn!"
    ],
    [
        "task": "Learn to Read Chord Diagrams",
        "description": "Learn the Song Structure: Identify verses, chorus, bridge. Online sources like Yousician might give you a best way to learn!"
    ]
]
