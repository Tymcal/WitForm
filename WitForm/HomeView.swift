//
//  HomeView.swift
//  WitForm
//
//  Created by Teema Khawjit on 12/11/24.
//

import SwiftUI

struct CurrentView: View {
    @State private var mainTab = 0 // Set the default tab to the second tab
    var body: some View {
        TabView(selection: $mainTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            EventView()
                .tabItem {
                    Image(systemName: "person.3")
                }
                .tag(1)
            ReportView()
                .tabItem {
                    Image(systemName: "exclamationmark.triangle")
                }
                .tag(2)
            SurveyView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
                }
                .tag(2)
        }
        .ignoresSafeArea()
    }
}

struct HomeView: View {
    var body: some View {
        Text("HomeView")
    }
}

#Preview {
//    HomeView()
    CurrentView()
}
