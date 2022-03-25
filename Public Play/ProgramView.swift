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
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                AsyncImage(
                    url: program.image,
                    content: { image in
                        image.resizable().aspectRatio( contentMode: .fill) }, placeholder: { ProgressView() }
                )
                .frame(width: geo.size.width, height: geo.size.height)
                .background(Color("PlaceholderBackground"))
                .clipped()
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Image(program.provider.image)
                            .resizable()
                            .frame(width: 32, height: 32)
                        Spacer()
                    }
                    Spacer()
                }
                
                if geo.size.width < geo.size.height {
                    VStack {
                        ContentView(program: program, isPortrait: true)
                    }
                    .frame(width: geo.size.width)
                    .background(Color("ProgramContentBackground"))
                } else {
                    HStack {
                        ContentView(program: program, isPortrait: false)
                    }
                    .frame(width: geo.size.width)
                    .background(Color("ProgramContentBackground"))
                }
            }
        }.navigationTitle(program.title)
    }
}

struct ContentView: View {
    let program: Program
    let isPortrait: Bool
    
    var body: some View {
        Text(program.description)
            .font(.body)
            .foregroundColor(.primary)
            .multilineTextAlignment(.leading)
            .padding(.all)
        
        if !isPortrait {
            Spacer()
        }
        
        Button() {
            openProgram()
        } label: {
            Label("Spela", systemImage: "play.fill").padding(.horizontal).font(.callout.bold())
        }
        .buttonStyle(.borderedProminent)
        .tint(.accentColor)
        .padding(.all)
        
        if isPortrait {
            Spacer().frame(height: 20)
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
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


