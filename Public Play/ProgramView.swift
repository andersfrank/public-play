//
//  ProgramView.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-25.
//

import SwiftUI

struct ProgramView: View {
    let program: Program

    var body: some View {
        Text("Selected player: \(program.title)")
            .font(.largeTitle)
    }
}
