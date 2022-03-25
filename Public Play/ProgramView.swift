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
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                
                AsyncImage(
                    url: program.image,
                    content: { image in
                        image.resizable().aspectRatio(contentMode: .fill) }, placeholder: { ProgressView() }
                )
                .frame(minWidth: 0, maxWidth: 5000, minHeight: 0, maxHeight: 150)
                .clipped()

                HStack(alignment: .center) {
                    Spacer()
                    Text(program.title)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                    
                HStack(alignment: .center) {
                    Spacer()
                    Button("Spela ") {
                        openProgram()
                    }
                        .buttonStyle(.borderedProminent)
                        .tint(.mint)
                        
                    Spacer()
                }
                
                Spacer()
            }
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Image("srplay")
                        .resizable()
                        .frame(width: 32, height: 32)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    private func openProgram() {
        guard let url = program.url else { return }
        UIApplication.shared.open(url)
    }
}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView(program: .mock)
    }
}

