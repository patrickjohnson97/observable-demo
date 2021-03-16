//
//  GoalCollectionDataStore.swift
//  observable-demo (iOS)
//
//  Created by Patrick Johnson on 3/15/21.
//

import Foundation
import SwiftUI
import Combine

class GoalCollectionDataStore: ObservableObject{
    @Published var goals: [Goal]
    var cancellables = [AnyCancellable]()

    init(){
        // NOTE: Use DB to retreive goals, ex:
        // let goals = DB.retreive(goals)
        // for each goal in goals, create new goal data store, add goal data store to result
        // set self.goals = result
        // NOTE: I will initialize with dummy data because I do not have DB
        self.goals = [Goal(name: "Test goal!")]
    }
    
    func updateGoal(goal: Goal){
        // NOTE: When you are interacting with the DB you will first save the goal to the DB, then refresh the goals list from the DB
        guard let goalToUpdateIndex = self.goals.firstIndex(where: {$0.id.uuidString == goal.id.uuidString}) else {return}
        self.goals[goalToUpdateIndex] = goal
    }
    
    func addGoal(goal: Goal){
        // NOTE: When you are interacting with the DB you will first save the goal to the DB, then refresh the goals list from the DB
        self.goals.append(goal)
    }
    
    func deleteGoal(goal: Goal){
        // NOTE: When you are interacting with the DB you will first delete the goal from the DB, then refresh the goals list from the DB
        self.goals.removeAll(where: {$0.id == goal.id})
    }
}
