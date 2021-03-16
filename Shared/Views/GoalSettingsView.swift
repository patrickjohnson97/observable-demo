//
//  GoalSettingsView.swift
//  observable-demo (iOS)
//
//  Created by Patrick Johnson on 3/15/21.
//

import SwiftUI

struct GoalSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var goalCollectionDataStore: GoalCollectionDataStore
    @State var goalId: UUID
    @State var name: String = ""
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Name")){
                        TextField("Start a business...", text: $name)
                    }
                    Section{
                        Button(action: {deleteGoal()}, label: {
                            Text("Delete Goal").foregroundColor(.red)
                        })
                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {saveGoal()}, label: {
                        Text("Done")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                        Text("Cancel")
                    })
                }
            })
        }
        
        .onAppear(perform: {
            let goal = goalCollectionDataStore.goals.first(where: {$0.id == self.goalId}) ?? Goal(name: "")
            self.name = goal.name
        })
    }
    
    func saveGoal(){
        let goalToUpdate = Goal(id: goalId, name: name)
        goalCollectionDataStore.updateGoal(goal: goalToUpdate)
        presentationMode.wrappedValue.dismiss()
    }
    
    func deleteGoal(){
        let goal = goalCollectionDataStore.goals.first(where: {$0.id == self.goalId}) ?? Goal(name: "")
        goalCollectionDataStore.deleteGoal(goal: goal)
        presentationMode.wrappedValue.dismiss()
    }
}

struct GoalSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalSettingsView(goalCollectionDataStore: GoalCollectionDataStore(), goalId: UUID())
    }
}
