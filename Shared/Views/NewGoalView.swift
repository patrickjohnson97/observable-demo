//
//  NewGoalView.swift
//  observable-demo (iOS)
//
//  Created by Patrick Johnson on 3/15/21.
//

import SwiftUI

struct NewGoalView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var goalCollectionDataStore: GoalCollectionDataStore
    @State var name: String = ""
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Name")){
                        TextField("Start a business...", text: $name)
                    }
                }
            }
            .navigationTitle("New Goal")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {saveGoal()}, label: {
                        Text("Add")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                        Text("Cancel")
                    })
                }
            })
        }
    }
    func saveGoal(){
        let goalToAdd = Goal(name: name)
        goalCollectionDataStore.addGoal(goal: goalToAdd)
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewGoalView_Previews: PreviewProvider {
    static var previews: some View {
        NewGoalView(goalCollectionDataStore: GoalCollectionDataStore())
    }
}
