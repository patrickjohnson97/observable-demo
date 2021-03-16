//
//  Goal.swift
//  observable-demo (iOS)
//
//  Created by Patrick Johnson on 3/15/21.
//

import Foundation
import SwiftUI
import Combine

struct Goal: Identifiable, Equatable {
    var id = UUID()
    var name: String
}
