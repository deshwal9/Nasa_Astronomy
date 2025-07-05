//
//  SelectedDateView.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//

import SwiftUI

struct SelectedDateView: View {
  @State private var selectedDate: Date = Date()
  @ObservedObject var viewModel = SelectedDateVM()
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
              .background(Color.red)
              .cornerRadius(8)
            }
            .padding(.horizontal, 10)
          }
          switch viewModel.pageState {
          case .loading:
            EmptyView()
          case .error(let error):
            let _ = print("error: \(error)")
          case .loaded(let model):
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 8){
                  VStack(alignment: .leading, spacing: 8){
                    Text(model.title)
                      .font(.largeTitle)
                      .fontWeight(.bold)
                    Text(model.date)
                      .font(.subheadline)
                  }
                  .padding(.horizontal, 10)
                  switch model.mediaType {
                  case .video:
                    if let videoUrl =  model.url {
                      VideoView(url: videoUrl)
                    }
                  case .image:
                    if let imageUrl =  model.hdurl {
                      VStack{
                        CacheAsyncImage(imageURL: imageUrl,scale: 0.8) { image in
                          image
                            .resizable()
                            .scaledToFill()
                            .contentShape(Rectangle())
                            .frame(maxWidth: fullView.size.width, maxHeight: fullView.size.height * 0.7)
                            .aspectRatio(contentMode: .fit)
                            .animation(.linear(duration: 0.5), value: image)
                        }
                      }
                    }
                  }
                 
                  Text(model.explanation)
                    .font(.body)
                    .padding(.horizontal, 10)
                  
                }
                .frame(maxWidth: .infinity, maxHeight:.infinity )
              
            }
            .padding(.bottom, 10 )
            // .ignoresSafeArea(edges: .top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background( Colors.backgroundColor.color )
          }
        }
      }
    }
    .sheet(isPresented: $viewModel.showCalendar) {
      CalenderSheet(date: $viewModel.selectedDate, isPresented: $viewModel.showCalendar) {
        viewModel.dateSelected()
      }
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

