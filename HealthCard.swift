//
//  HealthCard.swift
//  Watch_Health
//
//  Created by Raphael Awala on 22/02/2026.
//

import SwiftUI

struct HealthCard: View {

    let title: String
    let value: String
    let unit: String
    let color: Color
    let icon: String

    var body: some View {

        HStack {

            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)

            VStack(alignment: .leading) {

                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                HStack(alignment: .lastTextBaseline) {

                    Text(value)
                        .font(.title2)
                        .fontWeight(.bold)

                    Text(unit)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(color.opacity(0.15))
        )
    }
}
