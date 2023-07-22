//
//  TransitionBootcamp.swift
//  Bootcamp
//
//  Created by M Tayyab on 11/06/2023.
//

import SwiftUI

struct TransitionBootcamp: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            
            VStack {
                
                Button("Button"){
                    showView.toggle()
                }
                Spacer()
            }
            
            if(showView){
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height*0.5)
                    .transition(.move(edge: .bottom))
                    .animation(.easeOut)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
}

struct TransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionBootcamp()
    }
}
