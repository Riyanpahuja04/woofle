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
    var task: String
    var description: String
    @Binding var selectedTask: String?
    
    let _taskColor: Color = Color(red: 0.09, green: 0.09, blue: 0.09)
    let _descriptionColor: Color = Color(red: 0.16, green: 0.16, blue: 0.22)
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                if selectedTask == task {
                    selectedTask = nil
                } else {
                    selectedTask = task
                }
            }) {
                // TODO: Add tappable functionality
                Text(task)
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
            
            if(selectedTask == task) {
                Text(description)
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
        .animation(.easeInOut, value: selectedTask)
    }
    func isSelectedTask() -> Bool {
        withAnimation {
            if selectedTask == task {
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

#Preview {
    ActivitySelectionCard(task: "Learn Basic Chords", description: "The four most common guitar chords are E-Minor, C, G and D. Youtube Tutorials would be a good place to start!", selectedTask: .constant("Learn Basic Chords"))
}