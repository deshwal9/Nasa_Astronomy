//
//  TodaysView.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import SwiftUI

struct TodaysView: View {
  @ObservedObject var vm = TodaysVM()
  var body: some View {
    NavigationStack() {
      GeometryReader { fullView in
        switch vm.pageState {
        case .loading:
          progressbarView
        case .loaded(let model):
          AstroView(model: model, fullView: fullView)
        }
      }
    }
    .alert(isPresented: $vm.showAlert) {
      Alert(
        title: Text("Error"),
        message: Text("Something went wrong"),
        primaryButton: .cancel(),
        secondaryButton: .default(
          Text("Try again"),
          action: {
            vm.reloadInCaseOfError()
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
  TodaysView()
}

