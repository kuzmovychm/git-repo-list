//
//  ContentView.swift
//  Repo List
//
//  Created by Max Kuzmovych on 01.03.2020.
//  Copyright © 2020 Max Kuzmovych. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var repositoryService = GitHubRepositoryService()
    
    var body: some View {
        NavigationView {
            List(repositoryService.repositories) { repo in
                GitHubRepositoryView(name: repo.name, description: repo.description)
            }
            .navigationBarTitle("GitHub Repositories")
        }
        .onAppear {
            self.repositoryService.fetchRepositories()
        }
    }
}

struct GitHubRepositoryView: View {
    let name: String?
    let description: String?
    
    var body: some View {
        HStack {
            Text(name ?? "")
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width: 150.0)
                .multilineTextAlignment(.leading)
            Text(description ?? "")
        }
    }
}

let repos = [
    GitHubRepository(id: 1, name: "Name 1", description: "Description 1"),
    GitHubRepository(id: 2, name: "Name 2", description: "Description 2"),
    GitHubRepository(id: 3, name: "Name 3", description: "Description 3")
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
