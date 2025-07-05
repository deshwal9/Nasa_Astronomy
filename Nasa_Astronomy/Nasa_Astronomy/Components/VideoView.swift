//
//  VideoView.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 05/07/2025.
//

import SwiftUI
import AVKit

struct VideoView: View {
  @State private var player = AVPlayer()
  
  // Replace with your video URL (must be a direct .mp4 or streaming URL)
  var videoURL: URL
  init(url:URL) {
    self.videoURL = url
  }
  
  var body: some View {
    VideoPlayer(player: player)
      .onAppear {
        player = AVPlayer(url: videoURL)
        player.play()
      }
      .onDisappear {
        player.pause()
      }
      .frame(height: 300)
      .cornerRadius(8)
  }
}

#Preview {
  if  let videoUrl = URL(string: "https://www.youtube.com/embed/rQcKIN9vj3U?rel=0"){
    VideoView(url: videoUrl)
  }
}
