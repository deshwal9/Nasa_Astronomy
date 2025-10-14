//
//  TabBarView.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import SwiftUI

enum Tab {
  case today
  case week
  case selectedDate
  
  var title: String {
    switch self {
    case .today:
      return "Today"
    case .week:
      return "Week"
    case .selectedDate:
      return "Date"
    }
  }
}

struct TabBarView: View {
  @StateObject var tabBarModel = TabBarModel()
  
  init() {
    setupTabBarAppearance()
  }
  
    var body: some View {
      GeometryReader { reader in
        ZStack(alignment: .bottom) {
          ScrollViewReader { proxy in
            TabView {
              Group {
                todayTab(with: proxy)
               // weekTab(with: proxy)
                selectedTab(with: proxy)
              }
            }
            .tint(.white)
          }
        }
      }
    }
  
  private func todayTab(with proxy: ScrollViewProxy) -> some View {
    TodaysView()
      .tabItem({
        Image
          .systemIcon(.star)
      })
      .tag(Tab.today)
  }
  
  private func weekTab(with proxy: ScrollViewProxy) -> some View {
    WeekView()
      .tabItem({
        Image
          .systemIcon(.weekImage)
      })
      .tag(Tab.week)
  }
  private func selectedTab(with proxy: ScrollViewProxy) -> some View {
    SelectedDateView()
      .tabItem({
        Image
          .systemIcon(.calender)
      })
      .tag(Tab.selectedDate)
  }
  func setupTabBarAppearance() {
      let appearance = UITabBarAppearance()
      appearance.configureWithOpaqueBackground()
      appearance.backgroundColor = UIColor.black
      
    UITabBar.appearance().scrollEdgeAppearance = appearance
    
  }
}

#Preview {
    TabBarView()
}

