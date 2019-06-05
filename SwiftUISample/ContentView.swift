//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Matheus Fróes on 04/06/19.
//  Copyright © 2019 Matheus Fróes. All rights reserved.
//

import SwiftUI

struct Landmark: Identifiable {
    var id: Int
    let name: String
}

struct ContentView : View {
    let landmarks: [Landmark] = [
        Landmark(id: 1, name: "Yosemite"),
        Landmark(id: 2, name: "Sierra"),
        Landmark(id: 3, name: "Mojave"),
        Landmark(id: 4,name: "Catalina")
    ]
    
    var body: some View {
        NavigationView {
            List(landmarks.identified(by: \.id)) { landmark in
                LandmarkRow(landmark: landmark)
            }
            .navigationBarItem(title: Text("Edit"), titleDisplayMode: .inline, hidesBackButton: false)
            .navigationBarTitle(Text("Landmarks"), displayMode: .large)
        }
        .preferredColorScheme(.dark)

    }
}

struct LandmarkDetail: View {
    let landmark: Landmark
    
    var body: some View {
        VStack {
            Text(landmark.name)
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkRow: View {
    let landmark: Landmark
    
    var body: some View {
        HStack {
            PresentationButton(Text(landmark.name), destination: LandmarkDetail(landmark: landmark))
            Text(landmark.name)
            Spacer()
            Text(String(landmark.id))
        }
    }
}
