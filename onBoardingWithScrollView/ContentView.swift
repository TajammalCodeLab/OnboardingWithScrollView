//
//  ContentView.swift
//  onBoardingWithScrollView
//
//  Created by Ml bench-iOS Dev on 11/10/25.
//

import SwiftUI

enum OnboardingPages: String, Identifiable, CaseIterable {
  case welcome
  case location
  case userInput
  var data: OnboardingDataModel {
    switch self {
    case .location:
        .init(image: "", title: "Stay Strong Every Day", description: "Track your sobriety journey with simple daily check-ins that keep you motivated")
    case .welcome:
        .init(image: "", title: "See Your Savings Grow", description: "Turn your sobriety into real progress by tracking how much money you save each day, week, or month.")
    case .userInput:
        .init(image: "", title: "Connect Without Pressure", description: "Join small, private groups that support your journey without the noise of large social forums.")
    }
    
  }
  
  var id: String { self.rawValue }
  static var first: Self = .welcome
}


struct OnboardingDataModel {
  var image: String
  var title: String
  var description: String
}


struct ContentView: View {
  private var pages = OnboardingPages.allCases
  @State private var position: ScrollPosition = .init(idType: OnboardingPages.ID.self)
  
  
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHStack(spacing: 0) {
        ForEach(pages) { page in
          switch page {
          case .welcome:
            Welcome(data: page.data)
          case .location:
            Location(data: page.data)
          case .userInput:
            userInput(data: page.data)
          }
        }
        .containerRelativeFrame(.horizontal)
      }
      .scrollTargetLayout()
    }
    .scrollPosition($position)
    .scrollTargetBehavior(.viewAligned)
    .scrollIndicators(.hidden)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .onAppear {
      position.scrollTo(id: OnboardingPages.first.id)
    }
  }
}

#Preview {
  ContentView()
}


struct Welcome: View {
  var data: OnboardingDataModel
  var onComplete: (() -> Void)?
  var body: some View {
    VStack {
      Text(data.title)
      Text(data.description)
    }
    .background(.pink)
  }
}

struct Location: View {
  var data: OnboardingDataModel
  var onComplete: (() -> Void)?
  var body: some View {
    VStack {
      Text(data.title)
      Text(data.description)
    }
    .background(.blue)
  }
}
struct userInput: View {
  var data: OnboardingDataModel
  var onComplete: (() -> Void)?
  var body: some View {
    VStack {
      Text(data.title)
      Text(data.description)
    }
    .background(.green)
  }
}
