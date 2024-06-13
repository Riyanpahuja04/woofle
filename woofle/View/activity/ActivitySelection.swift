import SwiftUI

struct ActivitySelection: View {
    @State private var selectedOption: Option?
    @State private var isSpinning: Bool = false
    @State private var currentLevel: Int = 0
    @State private var canNavigate: Bool = false
    @State private var currentTask: String = ""
    private var goal = GoalManager()
    @State private var options: [Option] = []
    
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
                    ZStack {
                        Image("pawprint")
                            .resizable()
                            .rotationEffect(Angle(degrees: 32.42))
                            .frame(width: 138, height: 133)
                            .offset(x:150)
                       
                        VStack(alignment:.leading, spacing: 7) {
                           
                            Text(currentTask)
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                .foregroundStyle(_subTitleColor)
                            
                            
                            Text("What activity do you want to do?")
                                .font(.system(size: 35))
                                .fontWeight(.semibold)
                                .foregroundColor(_titleColor)
                            
                        }
                        .frame(width: 320)
                        
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Level \(GlobalActivityTracker.shared.level)")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(_titleColor)
                            .padding(.bottom, 30)
                        ForEach(options, id: \.id) { option in
                            ActivitySelectionCard(
                                option: option,
                                selectedOption: $selectedOption
                            )
                        }
                    }
                    .onAppear {
                        currentLevel = goal.getCurrentLevel()
                        options = goal.getOptions()
                        currentTask = goal.getCurrentTask()
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 2) {
                        Text("Don’t like these options?")
                            .font(.system(size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(_captionColor)
                        
                        
                        Button(action: {
                            isSpinning.toggle()
                            options = goal.getOptions()
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
                        .disabled(canNavigate)
                    }
                    .padding(.bottom, 30)
                    
                    // TODO: Add tappable functionality
                    WoofleActionButton(text: "Submit", action: {
                        GlobalActivityTracker.shared.selectedOption = selectedOption
                        GlobalActivityTracker.shared.currentGoal = goal.getCurrentTask()
                        print(selectedOption ?? "error")
                        if(selectedOption != nil) {
                            canNavigate = true
                            print(canNavigate)
                        }
                    })
                    
                    Spacer()
                }
                .safeAreaPadding(.top, 68)
                .navigationDestination(isPresented: $canNavigate) {
                    activitySelectedScreen()
                }
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
