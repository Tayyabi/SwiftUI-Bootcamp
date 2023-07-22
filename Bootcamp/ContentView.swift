//
//  ContentView.swift
//  Bootcamp
//
//  Created by M Tayyab on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    let columns: [GridItem] = [
        
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
    ]
    
    var body: some View {
        
        
        ScrollView{
            LazyVGrid(
                columns: columns,
                spacing: 6,
                pinnedViews: [],
                content: {
                    
                    Section(header:
                                Text("Section 1")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue)
                    ){
                        ForEach(0..<50) { index in
                            Rectangle()
                                .fill(Color.black)
                                .frame(height: 150)
                        }
                    }
                    
                    Section(header:
                                Text("Section 2")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.red)
                    ){
                        ForEach(0..<50) { index in
                            Rectangle()
                                .fill(Color.green)
                                .frame(height: 150)
                        }
                    }
                
                
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
