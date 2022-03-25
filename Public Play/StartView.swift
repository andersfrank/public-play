//
//  StartView.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-25.
//

import SwiftUI

struct StartView: View {
    @State private var programs = ProgramLoader.load(withProviderLimit: 10)
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("  Populärt")
                        .font(.title2)
                        .fontWeight(.bold)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(programs) { program in
                                VStack(alignment: .leading) {
                                    AsyncImage(url: program.image, content: { image in image.resizable().aspectRatio(contentMode: .fill).frame(width: 300, height: 170) }, placeholder: { ProgressView() })
                                        .frame(width: 300, height: 170)
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
                                        
                                    HStack {
                                        Text(program.title)
                                        Spacer()
                                    }.frame(width: 300, height: 20)
                                }
                            }
                        }
                    }
                }
                
                Spacer()
            }
            
//            List(programs) { program in
//                NavigationLink(destination: ProgramView(program: program)) {
//                HStack() {
//                    AsyncImage(url: program.image, content: { image in image.resizable().aspectRatio(contentMode: .fill).frame(width: 70, height: 70) }, placeholder: { ProgressView() })
//                        .frame(width: 70, height: 70)
//                        .clipped()
//                        .cornerRadius(4)
//                        .overlay(
//                            Image(program.provider.image)
//                                .resizable()
//                                .frame(width: 18, height: 18)
//                                .cornerRadius(3)
//                                .offset(x: 21, y: 21)
//                                .shadow(radius: 3)
//                        )
//                    VStack(alignment: .leading) {
//                        Text(program.title)
//                        Text(program.description)
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                    }
//                }
//                }
//            }
//            .navigationTitle("Populärt")
//            .onAppear(perform: loadData)
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
