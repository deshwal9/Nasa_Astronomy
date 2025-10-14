//
//  WeekView.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import SwiftUI

struct WeekView: View {
  @ObservedObject var date = WeekVM()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
  WeekView()
}
