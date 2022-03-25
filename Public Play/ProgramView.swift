//
//  ProgramView.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-25.
//

import SwiftUI

struct ProgramView: View {
    let program: Program
    
    @State var heightSizeOfImage: CGFloat = UIScreen.main.bounds.height/2
    
    @State var weightSizeOfImage: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                
                AsyncImage(
                    url: program.image,
                    content: { image in
                        image.resizable().aspectRatio( contentMode: .fill) }, placeholder: { ProgressView() }
                )
                .frame(width: weightSizeOfImage, height: heightSizeOfImage)
                .background(Color("PlaceholderBackground"))
                .clipped()
                
                Text(program.description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                VStack {
                    HStack(alignment: .center) {
                        Spacer()
                        Button() {
                            openProgram()
                        } label: {
                            Label("Spela", systemImage: "play.fill").padding(.horizontal).font(.callout.bold())
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.accentColor)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Image(program.provider.image)
                        .resizable()
                        .frame(width: 32, height: 32)
                    Spacer()
                }
                Spacer()
            }
        }.navigationTitle(program.title)
    }
    
    private func openProgram() {
        guard let url = program.url else { return }
        UIApplication.shared.open(url)
    }
}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView(program: .mock)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

