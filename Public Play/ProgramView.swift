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
            ScrollView(.vertical, showsIndicators: false ) {
                AsyncImage(
                    url: program.image,
                    content: { image in
                        image.resizable().aspectRatio( contentMode: .fill) }, placeholder: { ProgressView() }
                )
                .frame(width: geo.size.width, height: (geo.size.height > geo.size.width) ?  geo.size.width * 9/16 : geo.size.height * 9/16)
                .background(Color("PlaceholderBackground"))
                .clipped()
                .overlay(
                    Image(program.provider.image)
                        .resizable()
                        .frame(width: 32, height: 32).padding(.all),
                    alignment: .topTrailing)
                
                Text(program.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.all)
                
                Button() {
                    openProgram()
                } label: {
                    Label("Spela", systemImage: "play.fill").padding(.horizontal).font(.callout.bold()).frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.accentColor)
                .padding([.leading, .bottom, .trailing])
                
                Text(program.longDescription)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding([.leading, .bottom, .trailing])
            }
            
            Spacer()
            
        }.navigationBarTitleDisplayMode(.inline)
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
            .previewInterfaceOrientation(.landscapeRight)
    }
}


