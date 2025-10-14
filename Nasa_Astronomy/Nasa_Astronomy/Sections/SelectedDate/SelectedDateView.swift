//
//  SelectedDateView.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import SwiftUI

struct SelectedDateView: View {
  @ObservedObject var viewModel = SelectedDateVM()
  @Environment(\.safeAreaInsets) private var safeAreaInsets
  var body: some View {
    NavigationStack() {
      GeometryReader { fullView in
        VStack{
          VStack(alignment: .leading, spacing: 20) {
            HStack{
              Text("Selected date: \(viewModel.selectedDate.toShowString)")
              Spacer()
              Button("Pick a Date") {
                viewModel.showCalendar.toggle()
              }
              .buttonStyle(.bordered)
              .cornerRadius(8)
            }
            .padding(.horizontal, 10)
          }
          switch viewModel.pageState {
          case .loading:
            EmptyView()
          case .loaded(let model):
             AstroView(model: model, fullView: fullView)
          }
        }
      }
    }
    .sheet(isPresented: $viewModel.showCalendar) {
      CalenderSheet(date: $viewModel.selectedDate, isPresented: $viewModel.showCalendar) {
        viewModel.dateSelected()
      }
    }
    .alert(isPresented: $viewModel.showAlert) {
      Alert(
        title: Text("Error"),
        message: Text("Something went wrong"),
        primaryButton: .cancel(),
        secondaryButton: .default(
          Text("Try again"),
          action: {
            viewModel.reloadInCaseOfError()
          }))
    }
  }
  
  @ViewBuilder
  var progressbarView: some View {
    ProgressView()
      .progressViewStyle(
        CircularProgressViewStyle(tint: .red))
      .scaleEffect(2)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
    SelectedDateView()
}

