import SwiftUI

struct GetReady: View {
    
    private var _titleTextColor: Color = Color(red: 0.43, green: 0.6, blue: 0.59)
    
    var body: some View {
        VStack {
            Image("woofle-standing")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
                .padding(.top, 90)
            
            Text("Let’s customise your discovery experience.")
                .font(Font.custom("Darumadrop One", size: 35))
                .foregroundColor(_titleTextColor)
                .frame(width: 340, alignment: .leading)
                .padding(.top, 10)
                .padding(.leading, 25)
            
            Text("Break down your goal into activities")
                .font(
                    Font.system(size: 25)
                )
                .fontWeight(.medium)
                .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.21))
                .frame(width: 291, alignment: .leading)
                .padding(.top, -10)
                .padding(.leading, -15)

            WoofleActionButton(text: "Let's do it!") {
                // TODO: Add navigation functionality
            }
            .padding(.top, 80)
            .shadow(color: .black.opacity(0.05), radius: 1, x: 0, y: 1)

            Spacer()
        }
        .background(Color(hex: "#FFFDF8"))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    GetReady()
}
