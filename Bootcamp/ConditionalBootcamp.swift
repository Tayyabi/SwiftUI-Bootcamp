//
//  ConditionalBootcamp.swift
//  Bootcamp
//
//  Created by M Tayyab on 16/05/2023.
//

import SwiftUI

struct ConditionalBootcamp: View {
    
    @State var showCircle: Bool = false
    
    @State var isLoading: Bool = false
    
    
    var body: some View {
        
        Button("IS LOADING: \(isLoading.description)"){
            isLoading.toggle()
        }
        
        if isLoading {
            ProgressView()
        }
        
        Spacer()
        
//        VStack {
//
//            Button("Circle Button: \(showCircle.description)"){
//                showCircle.toggle()
//            }
//
//            if(showCircle)
//            {
//                Circle()
//                    .frame(width: 100, height: 100)
//            }
//            else {
//                Rectangle()
//                    .frame(width: 100, height: 100)
//            }
//            Spacer()
//        }
    }
}

struct ConditionalBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalBootcamp()
    }
}
