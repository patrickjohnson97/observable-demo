//
//  GoalDetailView.swift
//  observable-demo (iOS)
//
//  Created by Patrick Johnson on 3/15/21.
//

import SwiftUI

struct GoalDetailView: View {
    @ObservedObject var goalCollectionDataStore: GoalCollectionDataStore
    @State var goalId: UUID
    @State var showSettingsSheet = false
    var body: some View {
            VStack{
                Form{
                    Section(header: Text("Name")){
                        let goal = goalCollectionDataStore.goals.first(where: {$0.id == self.goalId}) ?? Goal(name: "")
                        Text(goal.name)
                    }
                }
            }
            .navigationTitle("Goal")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {showSettingsSheet = true}, label: {
                        Image(systemName: "gear")
                    })
                }
            })
            // NOTE: For some reason, I had to put the sheet out here, but I would prefer to put it by the Button
            .sheet(isPresented: $showSettingsSheet, content: {
                GoalSettingsView(goalCollectionDataStore: goalCollectionDataStore, goalId: goalId)
            })
    }
}

struct GoalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailView(goalCollectionDataStore: GoalCollectionDataStore(), goalId: UUID())
    }
}
