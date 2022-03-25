//
//  TabView.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            StartView()
                .tabItem {
                    Label("Start", systemImage: "list.dash")
                }

            ContentView()
                .tabItem {
                    Label("Sök", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
