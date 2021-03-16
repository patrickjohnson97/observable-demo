//
//  ContentView.swift
//  Shared
//
//  Created by Patrick Johnson on 3/15/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GoalCollectionView(goalCollectionDataStore: GoalCollectionDataStore())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
