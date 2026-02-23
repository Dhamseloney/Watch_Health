import SwiftUI

struct ContentView: View {

    @StateObject private var tracker = HealthTrackerModel()

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 16) {

                    // Calories Card
                    HealthCard(
                        title: "Calories",
                        value: "\(tracker.calories)",
                        unit: "kcal",
                        color: .orange,
                        icon: "flame.fill"
                    )

                    // Water Card
                    HealthCard(
                        title: "Water",
                        value: "\(tracker.waterML)",
                        unit: "ml",
                        color: .blue,
                        icon: "drop.fill"
                    )

                    NavigationLink {
                        EntryView(tracker: tracker)
                    } label: {
                        Label("Log Entry", systemImage: "plus")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)

                    Button(role: .destructive) {
                        tracker.resetDay()
                    } label: {
                        Label("Reset Day", systemImage: "arrow.counterclockwise")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)

                }
                .padding()
            }
            .navigationTitle("Health Tracker")
        }
    }
}
