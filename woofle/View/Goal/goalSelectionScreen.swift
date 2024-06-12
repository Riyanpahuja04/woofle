import SwiftUI

struct GoalSelection: View {
    @State private var selectedOption: Option?
    @State private var isSpinning: Bool = false
    @State private var canNavigate: Bool = false
    private var goal = GoalManager()
    @State private var options: [Option] = []
    
    private let _titleColor = Color(red: 0.28, green: 0.29, blue: 0.43)
    private let _subTitleColor = Color(red: 1, green: 0.99, blue: 0.95)
    private let _captionColor = Color(red: 0.09, green: 0.09, blue: 0.09)
    private let _linkColor = Color(red: 0.43, green: 0.6, blue: 0.59)
    
    private let _defaultBackgroundColor: Color = Color(red: 255/255, green: 253/255, blue: 248/255)
    
    // TODO: fetch api data to show
    var body: some View {
        ScrollView {
            ZStack {
                Image("TopBgActivity")
                    .resizable()
                    .scaledToFill()
                    .offset(x:0,y:-30)
                
                    Image("pawprint")
                        .resizable()
                        .rotationEffect(Angle(degrees: 32.42))
                        .frame(width: 138, height: 133)
                        .offset(x:160, y:-320)
                
                VStack(spacing: 5) {
                    // TODO: populate data from api
                    VStack(alignment: .leading, spacing: 7) {
                        Text(" ")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .foregroundStyle(_subTitleColor)
                        
                        
                        Text("What is your goal?")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(_titleColor)
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    VStack {
                        Text("Select an option below:")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(_titleColor)
                            .padding(.bottom, 30)
                        ForEach(options, id: \.self) { option in
                            ActivitySelectionCard(
                                option: option,
                                selectedOption: $selectedOption
                            )
                        }
                    }
                    .onAppear {
                        options = goal.getStaticGoalOptions()
                    }
                    
                    Spacer().frame(height: 60)
                    
                    HStack(spacing: 2) {
                        Text(" ")
                            .font(.system(size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(_captionColor)
                        
                        
                        Button(action: {
                            isSpinning.toggle()
                            options = goal.getOptions()
                        }) {
                            HStack(spacing: 2) {
                                Text(" ")
                                    .font(Font.system(size: 15))
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(_linkColor)
                                
                            }
                            
                        }
                        .disabled(canNavigate)
                    }
                    
                    // TODO: Add tappable functionality
                    WoofleActionButton(text: "Submit", action: {
                        print(selectedOption ?? "error")
                        if(selectedOption != nil) {
                            GlobalActivityTracker.shared.currentGoal = selectedOption?.brief ?? "Error"
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
        .background(_defaultBackgroundColor)
        .ignoresSafeArea()
    }
}

#Preview {
    GoalSelection()
}
