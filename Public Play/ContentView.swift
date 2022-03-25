//
//  ContentView.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-24.
//

import SwiftUI

struct ContentView: View {
    @State private var programs = ProgramLoader.load(withProviderLimit: 10)
    var body: some View {
        NavigationView {
            List(programs) { program in
                NavigationLink(destination: ProgramView(program: program)) {
                HStack() {
                    AsyncImage(url: program.image, content: { image in image.resizable().aspectRatio(contentMode: .fill).frame(width: 70, height: 70) }, placeholder: { ProgressView() })
                        .frame(width: 70, height: 70)
                        .clipped()
                        .cornerRadius(4)
                        .overlay(
                            Image(program.provider.image)
                                .resizable()
                                .frame(width: 18, height: 18)
                                .cornerRadius(3)
                                .offset(x: 21, y: 21)
                                .shadow(radius: 3)
                        )
                    VStack(alignment: .leading) {
                        Text(program.title)
                        Text(program.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                }
            }
            .navigationTitle("Sök")
//            .onAppear(perform: loadData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
