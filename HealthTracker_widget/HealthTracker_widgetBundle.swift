//
//  HealthTracker_widgetBundle.swift
//  HealthTracker_widget
//
//  Created by Raphael Awala on 21/02/2026.
//

import WidgetKit
import SwiftUI



struct HealthTracker_widget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "HealthTrackerWidget",
            provider: Provider()
        ) { entry in
            HealthTrackerWidgetView(entry: entry)
        }
        .supportedFamilies([.accessoryCircular, .accessoryRectangular])
    }
}
