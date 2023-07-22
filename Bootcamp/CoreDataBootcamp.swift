//
//  CoreDataBootcamp.swift
//  Bootcamp
//
//  Created by M Tayyab on 01/07/2023.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        self.container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores(completionHandler:   { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
            else {
                print("Successfully loaded core data!")
            }
            
        })
        fetchFruits()
    }
    
    
    func fetchFruits(){
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        }
        catch let error {
            print("Error fetching. \(error)")
        }
        
    }
    
    func addFruit(text: String){
     
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func updateFruit(entity: FruitEntity){
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        }
        catch let error {
            print("Error saving. \(error)")
        }
        
    }
}

struct CoreDataBootcamp: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                TextField("Add fruits here...", text: $textFieldText )
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                
                Button(action: {
                    guard !textFieldText.isEmpty else {
                        return
                    }
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(10)
                        .padding(.horizontal)
                })
                
                List{
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "Unknown")
                            .onTapGesture{
                                vm.updateFruit(entity: entity)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit(indexSet:))
                }
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .navigationTitle("Fruits")
        }
    }
}

struct CoreDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootcamp()
    }
}
