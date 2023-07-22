//
//  NavigationStackBootcamp.swift
//  Bootcamp
//
//  Created by M Tayyab on 24/06/2023.
//

import SwiftUI

struct NavigationStackBootcamp: View {
    
    let fruits = ["Apple","Orange","Banana"]
    
    var body: some View {
//        NavigationView{
//            ScrollView {
//                VStack(spacing: 40){
//                    ForEach(0..<10){ x in
//                        NavigationLink(destination: {
//                            MySecondScreen(value: x)
//                        }, label: {
//                            Text("Click me: \(x)")
//                        })
//
//                    }
//                }
//            }
//            .navigationTitle("Nav Bootcamp")
//        }
        
        
        NavigationStack{
            ScrollView {
                VStack(spacing: 40){
                    
                    ForEach(fruits, id: \.self){ fruit in
                        NavigationLink(value: fruit, label: {
                            Text(fruit)
                        })
                    }
                    
                    
                    ForEach(0..<10){ x in
                        
                        
                        NavigationLink(value: x, label: {
                            Text("Click me \(x)")
                        })
                        
                    }
                }
            }
            .navigationTitle("Nav Bootcamp")
            .navigationDestination(for: Int.self) { value in
                MySecondScreen(value: value)
            }
            .navigationDestination(for: String.self) { value in
                Text("ANOTHER SCREEN: \(value)")
            }
        }
    }
}

struct MySecondScreen: View {
    
    let value: Int
    init(value: Int){
        self.value = value
        print("INIT SCREEN \(value)")
    }
    
    var body: some View{
        
       Text("Screen \(value)")
    }
}

struct NavigationStackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackBootcamp()
    }
}
