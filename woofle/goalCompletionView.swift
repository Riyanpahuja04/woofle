//
//  goalCompletionView.swift
//  woofle
//
//  Created by Megan Nguyen on 6/6/2024.
//


import SwiftUI
import SDWebImageSwiftUI

struct goalCompletionView: View {
    var body: some View {
        AnimatedImage(url: URL(string: "https://i.imgur.com/l6eKr1D.gif"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
    }
}

struct goalCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        goalCompletionView()
    }
}



