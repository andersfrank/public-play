//
//  ProgramsView.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-25.
//

import SwiftUI

struct ProgramsView: View {
    var programs: [Program]
    var title: String
    let size = CGSize(width: 100, height: 50)
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Text("Work in progress ⚠️")
                Spacer()
            }.navigationTitle(title)
        }
    }
}

struct ProgramsView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramsView(
            programs: ProgramLoader.load(withProviderLimit: 40),
            title: "Program"
        )
    }
}
