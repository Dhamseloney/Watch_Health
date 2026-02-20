import Foundation
import SwiftUI
import Combine


class HealthTrackerModel: ObservableObject {

    // Justin Fletcher

    @Published var calories: Int = 0
    @Published var waterLitres: Double = 0.0

    private let saveKey = "DayData"

    init() {
        loadData()
        resetIfNewDay()
    }

    func addCalories(_ amount: Int) {
        calories += amount
        saveData()
    }

    func addWater(ml: Double) {
        waterLitres += ml / 1000
        saveData()
    }

    private func saveData() {
        let data: [String: Any] = [
            "calories": calories,
            "water": waterLitres,
            "date": Date()
        ]
        UserDefaults.standard.set(data, forKey: saveKey)
    }

    private func loadData() {
        guard let data = UserDefaults.standard.dictionary(forKey: saveKey) else { return }
        calories = data["calories"] as? Int ?? 0
        waterLitres = data["water"] as? Double ?? 0
    }

    private func resetIfNewDay() {
        guard let data = UserDefaults.standard.dictionary(forKey: saveKey),
              let savedDate = data["date"] as? Date else { return }

        if !Calendar.current.isDateInToday(savedDate) {
            calories = 0
            waterLitres = 0
            saveData()
        }
    }
}
//
//  HealthTrackerModel.swift
//  Watch_Health
//
//  Created by Raphael Awala on 18/02/2026.
//

