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
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(programs) { program in
                    NavigationLink(destination: ProgramView(program: program)) {
                        ZStack {
                            AsyncImage(url: program.image, content: {
                                image in image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .layoutPriority(-1)
                            }, placeholder: { ProgressView() })
                            
                            
                            VStack {
                                Spacer()
                                    .frame(maxWidth: .infinity)
                                    .overlay(
                                        Image(program.provider.image)
                                            .resizable()
                                            .frame(
                                                width: 32,
                                                height: 32
                                            )
                                            .cornerRadius(3)
                                            .shadow(radius: 3)
                                            .padding(8)
                                        ,
                                        alignment: .bottomTrailing
                                    )
                            }
                        }
                        .clipped()
                        .aspectRatio(16/9, contentMode: .fill)
                        .background(Color("PlaceholderBackground"))
                        .cornerRadius(4)
                        .padding([.top, .bottom])
                        .padding(.leading, 4.0)
                    }
                }
            }
            .padding(.leading, 12.0)
            .padding(.trailing)
            Spacer()
        }.navigationTitle(title)
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
