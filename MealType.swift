//
//  MealType.swift
//  Watch_Health
//
//  Created by Raphael Awala on 22/02/2026.
//

import Foundation

enum MealType: String, CaseIterable, Identifiable {
    case meal
    case drink

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .meal:
            return "Meal"
        case .drink:
            return "Drink"
        }
    }
}
