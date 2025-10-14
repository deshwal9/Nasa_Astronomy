//
//  CalenderSheetView.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 04/10/2025.
//
import SwiftUI

public typealias SimpleAction = () -> Void

struct CalenderSheet: View {
    @Binding var date: Date
    @Binding var isPresented: Bool
    var today = Date()
    private var action: SimpleAction?
  
  init(date: Binding<Date>,
       isPresented: Binding<Bool>,
       action: SimpleAction? = nil) {
    self._date = date
    self._isPresented = isPresented
    self.action = action
  }

  
  var body: some View {
    if #available(iOS 16.4, *) {
      addToCalendarContent
        .presentationCornerRadius(16)
        .presentationDetents(UIScreen.main.bounds.height <= 667 ? [.fraction(0.55)] : [.fraction(0.55)])
    } else {
      addToCalendarContent
        .cornerRadius(16)
        .presentationDetents(UIScreen.main.bounds.height <= 667 ? [.fraction(0.55)] : [.fraction(0.55)])

    }
  }

  private var addToCalendarContent: some View {
    NavigationView {
      VStack {
        DatePicker(
          "select a date", selection: $date,
          in: ...today,
          displayedComponents: .date
        )
        .tint(.red)
        .datePickerStyle(.graphical)
        .labelsHidden()
        .fixedSize(horizontal: false, vertical: true)
      }.padding(.all , 20)
      .frame(maxHeight: 400)
      .navigationTitle("Choose Date")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Button("Done") {
            isPresented = false
            action?()
          }.tint(.blue)
        }
      }
    }
  }
}
