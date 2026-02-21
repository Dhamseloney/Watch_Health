//
//  ContentView.swift
//  Watch_Health Watch App
//
//  Created by Raphael Awala on 09/02/2026.
//
import SwiftUI

struct ContentView: View {

    @State private var tracker = HealthTrackerModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {

                    statCard(
                        title: "Calories",
                        value: "\(tracker.calories)",
                        unit: "kcal"
                    )

                    statCard(
                        title: "Water",
                        value: String(format: "%.2f", tracker.waterLitres),
                        unit: "litres"
                    )

                    NavigationLink {
                        EntryView(tracker: $tracker)
                    } label: {
                        Text("Log Meal / Drink")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)

                    Button(role: .destructive) {
                        tracker.resetDay()
                    } label: {
                        Text("Reset Day")
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Today")
        }
    }

    
    @ViewBuilder
    private func statCard(title: String, value: String, unit: String) -> some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.title2)
                .fontWeight(.semibold)

            Text(unit)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.15))
        )
    }
}

#Preview {
    ContentView()
}
