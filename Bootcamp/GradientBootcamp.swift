//
//  GradientBootcamp.swift
//  Bootcamp
//
//  Created by M Tayyab on 21/05/2023.
//

import SwiftUI

struct GradientBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
//                LinearGradient(
//                    gradient: Gradient(colors: [Color.red, Color.blue, Color.green]),
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing)
                
                RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center, startRadius: 5, endRadius: 200)
                
                
            )
            .frame(width: 300, height: 200)
    }
}

struct GradientBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GradientBootcamp()
    }
}
