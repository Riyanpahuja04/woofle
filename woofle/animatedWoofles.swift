//
//  animatedWoofles.swift
//  woofle
//
//  Created by Megan Nguyen on 6/6/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct animatedWoofles: View {
    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: "https://i.imgur.com/l6eKr1D.gif"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            AnimatedImage(url: URL(string: "https://i.imgur.com/f93Bu3G.gif"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
    }
}

struct animatedWoofles_Previews: PreviewProvider {
    static var previews: some View {
        animatedWoofles()
    }
}
