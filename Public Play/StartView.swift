//
//  StartView.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-25.
//

import SwiftUI

struct StartView: View {
    private var popular = ProgramLoader.load(withProviderLimit: 10)
    private var new = ProgramLoader.load(withProviderLimit: 10)
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                HList(title: "Populärt", programs: popular)
                HList(title: "Nytt", programs: new)
                Spacer()
            }.navigationTitle("Titta nu")
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

struct HList: View {
    var title: String
    var programs: [Program]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(programs) { program in
                        VStack(alignment: .leading) {
                            AsyncImage(url: program.image, content: { image in image.resizable().aspectRatio(contentMode: .fill).frame(width: 330, height: 1850) }, placeholder: { ProgressView() })
                                .frame(width: 330, height: 185)
                                .clipped()
                                .cornerRadius(4)
                                .overlay(
                                    Image(program.provider.image)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(3)
                                        .offset(x: 139, y: 67)
                                        .shadow(radius: 3)
                                ).shadow(radius: 3)
                                
                            HStack {
                                Text(program.title)
                                Spacer()
                            }.frame(width: 300, height: 20)
                        }
                    }
                }
            }
        }
    }
}
