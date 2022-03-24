//
//  ContentView.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-24.
//

import SwiftUI

struct ContentView: View {
    @State private var programs: [Program] = []
    var body: some View {
        NavigationView {
            List {
                ForEach(programs) { program in
                    HStack() {
                            AsyncImage(url: program.image, content: { image in image.resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50) }, placeholder: { ProgressView() })
                            .frame(width: 50, height: 50)
                            .clipped()
                            .cornerRadius(10)
                            .overlay(
                                Image("srplay")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .offset(x: 20, y: 20)
                            )
                        VStack(alignment: .leading) {
                            Text(program.title)
                            Text(program.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                    }
                }
            }.onAppear(perform: loadData).navigationTitle("Populärt")
        }
    }
    
    private func loadData() {
        self.programs = loadSVTPrograms() + loadSRPrograms() + loadURPrograms()
        print(self.programs)
    }
    
    private func loadURPrograms() -> [Program] {
        guard let products = SearchResponse.loadJSON()?.results else  { return [] }
        return products.compactMap { Program(urProduct: $0) }
    }
    private func loadSRPrograms() -> [Program] {
        guard let programs = SRPopular.loadJSON()?.collection else  { return [] }
        return programs.compactMap { Program(srProgram: $0) }
    }
    private func loadSVTPrograms() -> [Program] {
        guard let programs = SVTPopular.loadJSON()?.data.selections.first?.items[...9] else { return [] }
        return programs.compactMap { Program(svtProgram: $0) }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
