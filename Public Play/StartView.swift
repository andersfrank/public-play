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
    private var documentaries = ProgramLoader.load(withProviderLimit: 10)
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                HList(
                    title: "Populärt",
                    programs: popular,
                    size: .init(width: 330, height: 185)
                )
                Spacer(minLength: 30)
                
                HStack {
                    Text("Public service samlat ❤️")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    Spacer()
                }
                HStack {
                    IconView(provider: .sr)
                    IconView(provider: .svt)
                    IconView(provider: .ur)
                    Spacer()
                }.padding(.horizontal)
                
                Spacer(minLength: 30)
                
                HList(
                    title: "Nytt",
                    programs: new,
                    size: .init(width: 140, height: 78)
                )
                
                Spacer(minLength: 30)
                
                HList(
                    title: "Dokumentärer",
                    programs: documentaries,
                    size: .init(width: 140, height: 78)
                )
                
                Spacer()
            }.navigationTitle("Titta nu")
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StartView()
            
            StartView()
                .environment(\.colorScheme, .dark)
        }
    }
}

struct HList: View {
    var title: String
    var programs: [Program]
    var size: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal)
                
                Spacer()
// Uncomment to display "Visa alla" button:
//                NavigationLink(destination: ProgramsView(programs: programs, title: title)) {
//                    Text("Visa alla").padding(.horizontal)
//                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    HStack(spacing: 10) {
                        ForEach(programs) { program in
                            NavigationLink(destination: ProgramView(program: program)) {
                                VStack(alignment: .leading) {
                                    AsyncImage(url: program.image, content: { image in image.resizable().aspectRatio(contentMode: .fill).frame(width: size.width, height: size.height) }, placeholder: { ProgressView() })
                                        .frame(width: size.width, height: size.height)
                                        .clipped()
                                        .background(Color("PlaceholderBackground"))
                                        .cornerRadius(4)
                                        .overlay(
                                            Image(program.provider.image)
                                                .resizable()
                                                .frame(width: size.width / 8, height: size.width / 8)
                                                .cornerRadius(3)
                                                .offset(x: size.width / 2 - size.width / 11, y: size.height / 2 - size.width / 12)
                                                .shadow(radius: 3)
                                        ).shadow(radius: 3)
                                    HStack {
                                        Text(program.title).foregroundColor(.primary)
                                        Spacer()
                                    }.frame(width: size.width, height: 20)
                                }
                            }
                            
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct IconView: View {
    let provider: Program.Provider
    var body: some View {
        Image(provider.image)
            .resizable()
            .frame(width: 40, height: 40)
            .cornerRadius(3)
            .shadow(radius: 3)
    }
}
