import SwiftUI

struct EntryView: View {

    @ObservedObject var tracker: HealthTrackerModel

    @State private var selectedType: MealType? = nil
    @State private var inputValue: String = ""

    var body: some View {

        ScrollView {

            VStack(spacing: 12) {

                Text("Select Type")
                    .font(.headline)

                // Calories button
                Button {
                    selectedType = .meal
                } label: {

                    Label("Calories", systemImage: "flame.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(selectedType == .meal ? .orange : .gray)

                // Water button
                Button {
                    selectedType = .drink
                } label: {

                    Label("Water", systemImage: "drop.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(selectedType == .drink ? .blue : .gray)

                // Input field appears only after selecting type
                if selectedType != nil {

                    TextField(
                        selectedType == .meal
                        ? "Enter calories"
                        : "Enter water (ml)",
                        text: $inputValue
                    )
                    .multilineTextAlignment(.center)
                    

                    Button {

                        guard let value = Int(inputValue), value > 0 else {
                            return
                        }

                        if selectedType == .meal {

                            tracker.addCalories(value)

                        } else if selectedType == .drink {

                            tracker.addWater(ml: value)

                        }

                        inputValue = ""

                    } label: {

                        Text("Add")
                            .frame(maxWidth: .infinity)

                    }
                    .buttonStyle(.borderedProminent)
                }

            }
            .padding()
        }
        .navigationTitle("Log Entry")
    }
}
