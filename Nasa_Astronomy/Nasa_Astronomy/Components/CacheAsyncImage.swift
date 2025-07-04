//
//  CacheAsyncImage.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 04/07/2025.
//

import SwiftUI
public typealias SimpleAction = () -> Void

struct CacheAsyncImage<Content>: View where Content: View{
    private let imageURL: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let width: CGFloat?
    private let height: CGFloat?
    private let aspectRatio: CGFloat?
    private var content: (Image) -> Content
   

    init(imageURL: URL,
         scale: CGFloat = 1.0,
         transaction: Transaction = Transaction(),
         width: CGFloat? = nil,
         height: CGFloat? = nil,
         aspectRatio: CGFloat? = nil,
         @ViewBuilder content: @escaping (Image) -> Content
      ){
      //@ViewBuilder placeHolder: @escaping (Image) -> Content
        self.imageURL = imageURL
        self.scale = scale
        self.transaction = transaction
        self.content = content
        self.width = width
        self.height = height
        self.aspectRatio = aspectRatio
       // self.placeholder = placeHolder
    }

    var body: some View {
        if let cachedImage = ImageCache[imageURL] {
            // Return cached image
          content(cachedImage)
        } else {
            // Load and cache image using AsyncImage
          AsyncImage(url: imageURL) { image in
            imageHandler(image)
          } placeholder: {
            VStack{
              ProgressView()
                .progressViewStyle(
                  CircularProgressViewStyle(tint: .red))
                .scaleEffect(2)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: width, height: height)
            .aspectRatio(aspectRatio ?? 1, contentMode: .fit)
          }
        }
    }
  
   private func imageHandler(_ image: Image?) -> some View {
    guard let image else {
      return content(Image.icon(.placeholder))
    }
     //  Save image to cache
     ImageCache.saveImage(image, to: imageURL)
    return content(image)
  }  
}

#Preview {
  let imageurl = "https://apod.nasa.gov/apod/image/2506/almosttrees_mro_2560.jpg"
  CacheAsyncImage(imageURL: URL(string: imageurl)!){ image in
      image
  }
//  placeHolder: { image in
//     image
//  }
}
