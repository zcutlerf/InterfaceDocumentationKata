//
//  HeroDetailView.swift
//  InterfaceDocumentationKata
//
//  Created by Zoe Cutler on 2/15/23.
//

import SwiftUI

struct HeroDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var hero: DocumentationHero
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                            .font(.title2)
                    }
                }
                
                Image(hero.imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(height: 260.0)
                
                Text(hero.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Divider()
                
                Text(hero.about)
            }
            .padding()
        }
    }
}

struct HeroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetailView(hero: DocumentationHero.docHeros.first!)
    }
}
