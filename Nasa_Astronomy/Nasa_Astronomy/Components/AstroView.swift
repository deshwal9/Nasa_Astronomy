//
//  AstroView.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 06/10/2025.
//

import SwiftUI

struct AstroView: View {
  @Environment(\.safeAreaInsets) private var safeAreaInsets
  let model: AstroImageModel
  let fullView: GeometryProxy
  
    var body: some View {
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
              VStack(alignment: .center, spacing: 8){
                VideoViewNew(videoURL: videoUrl)
                  .cornerRadius(8)
                  .frame(width: fullView.size.width - 20, height: 300)
              }
              .frame(width: fullView.size.width)
            }
          case .image:
            if let imageUrl =  model.url {
              VStack{
                CacheAsyncImage(imageURL: imageUrl,scale: 0.8) { image in
                  image
                    .resizable()
                    .scaledToFill()
                    .contentShape(Rectangle())
                    .frame(maxWidth: fullView.size.width, maxHeight: fullView.size.height * 0.7)
                    .aspectRatio(contentMode: .fill)
                    .animation(.linear(duration: 0.5), value: image)
                }
              }
            }
          case .other:
             EmptyView()
          }
          Text(model.explanation)
            .font(.body)
            .padding(.horizontal, 10)
          
        }
        .padding(.bottom, safeAreaInsets.bottom)
        .frame(maxWidth: .infinity, maxHeight:.infinity )
      }
      .ignoresSafeArea(edges: .bottom)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background( Colors.backgroundColor.color)
    }
}

#Preview {
  GeometryReader { geometry in
          AstroView(model: AstroImageModel(mock: true), fullView: geometry)
      }
}
