import Foundation

struct HealthTrackerModel {

    var calories: Int = 0
    var waterMl: Double = 0

    mutating func addCalories(_ amount: Int) {
        calories += amount
    }

    mutating func addWater(ml: Double) {
        waterMl += ml
    }

    mutating func resetDay() {
        calories = 0
        waterMl = 0
    }

    var waterLitres: Double {
        waterMl / 1000
    }
}
