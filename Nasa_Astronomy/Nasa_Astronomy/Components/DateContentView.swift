//
//  Data.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 04/07/2025.
//

import SwiftUI

struct DateContentView: View {
    @State private var selectedDate = Date()

    // Sample data keyed by date (for demo purposes)
    private let dataByDate: [String: String] = [
        "2025-07-01": "Content for July 1st",
        "2025-07-02": "Content for July 2nd",
        "2025-07-03": "Special content for July 3rd 🎉"
    ]

    var body: some View {
        VStack(spacing: 20) {
            // Date Picker
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .padding()

            Divider()

            // Content Section
            VStack(alignment: .leading, spacing: 12) {
                Text("Selected Date: \(formattedDate(selectedDate))")
                    .font(.headline)

                if let content = dataByDate[formattedDate(selectedDate)] {
                    Text(content)
                        .font(.body)
                        .foregroundColor(.primary)
                } else {
                    Text("No content available for this date.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding()

            Spacer()
        }
        .padding()
    }

    // Format date as "yyyy-MM-dd" to match dictionary keys
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

#Preview {
  DateContentView()
}
