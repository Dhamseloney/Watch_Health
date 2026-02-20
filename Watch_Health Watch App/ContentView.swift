//
//  ContentView.swift
//  Watch_Health Watch App
//
//  Created by Raphael Awala on 09/02/2026.
//

import SwiftUI
import Combine

struct ContentView: View {

    @StateObject private var tracker = HealthTrackerModel()

    var body: some View {
        VStack(spacing: 10) {
            Text("Today's Health Overview")
                .font(.headline)

            Text("Calories: \(tracker.calories)")
                .foregroundColor(.orange)
                .fontWeight(.semibold)

            Text(String(format: "Water: %.2f L", tracker.waterLitres))
                .foregroundColor(.blue)
                .fontWeight(.semibold)
            Button("Add 100 Calories") {
                tracker.addCalories(100)
            }

            Button("Add 250ml Water") {
                tracker.addWater(ml: 250)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

