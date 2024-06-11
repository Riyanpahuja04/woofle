//
//  ActivitySelectionButton.swift
//  woofle
//
//  Created by Riyan Pahuja on 4/6/2024.
//

import SwiftUI

// Global Variable to enable access for extension as well
let _teal: Color = Color(red: 0.43, green: 0.6, blue: 0.59)

struct ActivitySelectionCard: View {
    var option: Option
    @Binding var selectedOption: Option?
    
    let _taskColor: Color = Color(red: 0.09, green: 0.09, blue: 0.09)
    let _descriptionColor: Color = Color(red: 0.16, green: 0.16, blue: 0.22)
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                if selectedOption == option {
                    selectedOption = nil
                } else {
                    selectedOption = option
                }
            }) {
                // TODO: Add tappable functionality
                Text(option.brief)
                    .font(
                        .system(size: 18)
                    )
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundColor(isSelectedTask() ? Color.white : _taskColor)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isSelectedTask() ? _teal  : Color.clear)
            }
            .overlay(
                Rectangle()
                    .stroke(_teal, lineWidth: 1)
                
            )
            .cornerRadiusCustom(10, corners: isSelectedTask() ? [.topLeft, .topRight] : .allCorners)
            .padding(.horizontal, 50)
            
            if(selectedOption == option) {
                Text(option.description)
                    .font(
                        Font.system(size: 15)
                    )
                    .fontWeight(.medium)
                    .foregroundStyle(_descriptionColor)
                    .frame(maxWidth: .infinity, minHeight: 90)
                    .padding(.horizontal, 23)
                    .padding(.vertical, 20)
                    .background(.white)
                    .overlay(
                        Rectangle()
                            .stroke(_teal, lineWidth: 1)
                    )
                    .cornerRadiusCustom(10, corners: [.bottomLeft, .bottomRight])
                    .padding(.horizontal, 50)
                    .padding(.bottom, 17)
            }
        }
        .animation(.easeInOut, value: selectedOption)
    }
    func isSelectedTask() -> Bool {
        withAnimation {
            if selectedOption == option {
                return true
            }
            return false
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadiusCustom(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
            .overlay(RoundedCorner(radius: radius, corners: corners).stroke(_teal, lineWidth: 1))
    }
}
