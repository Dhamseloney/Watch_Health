import Foundation
import Combine

class HealthTrackerModel: ObservableObject {

    @Published var calories: Int
    @Published var waterML: Int

    private let caloriesKey = "calories"
    private let waterKey = "waterML"
    private let lastDateKey = "lastSavedDate"

    init() {

        let defaults = UserDefaults.standard

      
        if let lastSaved = defaults.object(forKey: lastDateKey) as? Date {

            if !Calendar.current.isDateInToday(lastSaved) {
                
                defaults.set(0, forKey: caloriesKey)
                defaults.set(0, forKey: waterKey)
            }
        }

        calories = defaults.integer(forKey: caloriesKey)
        waterML = defaults.integer(forKey: waterKey)

        
        defaults.set(Date(), forKey: lastDateKey)
    }

    func addCalories(_ value: Int) {
        calories += value
        save()
    }

    func addWater(ml: Int) {
        waterML += ml
        save()
    }

    func resetDay() {
        calories = 0
        waterML = 0
        save()
    }

    private func save() {
        let defaults = UserDefaults.standard
        defaults.set(calories, forKey: caloriesKey)
        defaults.set(waterML, forKey: waterKey)
        defaults.set(Date(), forKey: lastDateKey)
    }
}
