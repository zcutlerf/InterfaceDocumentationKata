//
//  ContentView.swift
//  InterfaceDocumentationKata
//
//  Created by Zoe Cutler on 2/15/23.
//

import SwiftUI

/// Our ContentView will list all of our documentation heros. When we tap on one of the heros in our list, we'll present a sheet with `HeroDetailView` to view details about our chosen hero.
struct ContentView: View {
    /// Here, we access the static property `docHeros` from the DocumentationHero type. Check out that file to read more about static properties.
    @State private var docHeros = DocumentationHero.docHeros
    
    /// This property will be nil if we are not viewing our `HeroDetailView` sheet. If we give it a hero as a value, the sheet will be presented.
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
