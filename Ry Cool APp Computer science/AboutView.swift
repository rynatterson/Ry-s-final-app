//
//  AboutView.swift
//  Ry Cool APp Computer science
//
//  Created by Ry Natterson on 5/22/23.
//

import Foundation
import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("About the Creator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .leading, endPoint: .trailing)
                )
            
            Text("Ry Natterson")
                .font(.title)
                .foregroundColor(.black)
                .padding()
            Image("Photo1")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: 200, height: 200)
                       .clipShape(Circle())
                       .padding()
            
            Text("Computer Science Enthusiast and Master Coder")
                .font(.title)
                .foregroundColor(.black)
                .padding()
            
            Text("Contact: ry.n24@k12.xrds.org")
                .font(.title)
                .foregroundColor(.black)
                .padding()
        }
    }
}
