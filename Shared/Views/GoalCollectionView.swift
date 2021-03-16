//
//  GoalCollectionView.swift
//  observable-demo (iOS)
//
//  Created by Patrick Johnson on 3/15/21.
//

import SwiftUI

struct GoalCollectionView: View {
    @ObservedObject var goalCollectionDataStore: GoalCollectionDataStore
    @State var showNewGoalView: Bool = false
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ForEach(goalCollectionDataStore.goals){ goal in
                        
                        NavigationLink(
                            destination: GoalDetailView(goalCollectionDataStore: goalCollectionDataStore, goalId: goal.id),
                            label: {
                                HStack{
                                    Spacer()
                                    Text(goal.name)
                                    Spacer()
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.gray).opacity(0.3))
                                
                            })
                            .buttonStyle(PlainButtonStyle())
                        
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .navigationTitle("Goal List")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {showNewGoalView = true}, label: {
                        Image(systemName: "plus")
                    })
                })
            })
            // NOTE: For some reason, I had to put the sheet out here, but I would prefer to put it by the Button
            .sheet(isPresented: $showNewGoalView, content: {
                NewGoalView(goalCollectionDataStore: goalCollectionDataStore)
            })
        }
    }
}

struct GoalCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        GoalCollectionView(goalCollectionDataStore: GoalCollectionDataStore())
    }
}
