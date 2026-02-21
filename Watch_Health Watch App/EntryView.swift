import SwiftUI

enum MealType: String, CaseIterable, Identifiable {
    case meal
    case drink

    var id: Self { self }

    var displayName: String {
        switch self {
        case .meal:
            return "Meal"
        case .drink:
            return "Drink"
        }
    }
}

struct EntryView: View {

    @Binding var tracker: HealthTrackerModel

    @State private var selectedType: MealType = .meal
    @State private var caloriesInput = ""
    @State private var waterInput = ""

    var body: some View {
        VStack(spacing: 16) {

            Picker("Type", selection: $selectedType) {
                ForEach(MealType.allCases) { type in
                    Text(type.displayName)
                }
            }

            if selectedType == .meal {
                TextField("Calories", text: $caloriesInput)

                Button("Add Calories") {
                    if let value = Int(caloriesInput) {
                        tracker.addCalories(value)
                        caloriesInput = ""
                    }
                }
            } else {
                TextField("Water (ml)", text: $waterInput)

                Button("Add Water") {
                    if let value = Double(waterInput) {
                        tracker.addWater(ml: value)
                        waterInput = ""
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Log Entry")
    }
}
