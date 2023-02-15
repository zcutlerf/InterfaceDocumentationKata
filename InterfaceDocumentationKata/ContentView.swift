//
//  ContentView.swift
//  InterfaceDocumentationKata
//
//  Created by Zoe Cutler on 2/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var docHeros = DocumentationHero.docHeros
    
    @State private var heroShowing: DocumentationHero?
    
    var body: some View {
        NavigationStack {
            List(docHeros) { docHero in
                HStack {
                    Image(docHero.imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(height: 60.0)
                    
                    VStack(alignment: .leading) {
                        Text(docHero.name)
                            .font(.headline)
                        Text(docHero.catchphrase)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button {
                        heroShowing = docHero
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }
                }
            }
            .navigationTitle("Documentation Heros")
            .sheet(item: $heroShowing) { hero in
                HeroDetailView(hero: hero)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
