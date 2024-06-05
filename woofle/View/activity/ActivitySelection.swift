import SwiftUI

struct ActivitySelection: View {
    @State private var selectedTask: String?
    @State private var isSpinning: Bool = false
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
                            .foregroundStyle(Color(red: 1, green: 0.99, blue: 0.95))
                        
                        
                        // TODO: populate data from api
                        Text("What activity you want to do?")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.28, green: 0.29, blue: 0.43))
                    }
                    .padding(.horizontal, 60)
                    
                    
                    Spacer()
                    
                    VStack {
                        Text("LEVEL 0")
                            .font(.system(size: 24)
                            )
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.28, green: 0.29, blue: 0.43))
                            .padding(.bottom, 30)
                        ForEach(sample.indices, id: \.self) { index in
                            ActivitySelectionButton(
                                task: sample[index]["task"]!,
                                description: sample[index]["description"]!,
                                selectedTask: $selectedTask
                            )
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 2) {
                        Text("Don’t like these options?")
                            .font(.system(size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color(red: 0.09, green: 0.09, blue: 0.09))
                        
                        
                        Button(action: {
                            isSpinning.toggle()
                        }) {
                            HStack(spacing: 2) {
                                Text("Refresh now")
                                    .font(
                                        Font.custom("SF Pro", size: 15)
                                            .weight(.medium)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(Color(red: 0.43, green: 0.6, blue: 0.59))
                                
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .foregroundStyle(Color(red: 0.43, green: 0.6, blue: 0.59))
                                    .rotationEffect(.degrees(isSpinning ? 360 : 0))
                                    .animation(Animation.linear(duration: 1).repeatCount(1, autoreverses: false), value: isSpinning)
                                
                                
                            }
                            
                        }
                    }
                    .padding(.bottom, 30)
                    
                    Button(action: {}) {
                        // TODO: Add tappable functionality
                        Text("Submit")
                            .font(
                                Font.custom("SF Pro", size: 16)
                                    .weight(.semibold)
                            )
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 25)
                            .background(Color(red: 1, green: 0.62, blue: 0.29))
                            .foregroundStyle(Color(red: 40/255, green: 42/255, blue: 55/255))
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.05), radius: 1, x: 0, y: 1)
                    .padding(.horizontal, 25)
                    
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
let sample = [
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
