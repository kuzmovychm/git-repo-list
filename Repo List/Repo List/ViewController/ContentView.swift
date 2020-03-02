//
//  ContentView.swift
//  Repo List
//
//  Created by Max Kuzmovych on 01.03.2020.
//  Copyright © 2020 Max Kuzmovych. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @ObservedObject var repositoryService: GitHubRepositoryService
    
    var body: some View {
        NavigationView {
            Group {
                if repositoryService.isLoading {
                    Loader(isAnimating: repositoryService.isLoading)
                } else {
                    List(repositoryService.gitHubRepositories) { repo in
                        GitHubRepositoryView(name: repo.name, description: repo.description)
                    }
                }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(repositoryService: GitHubRepositoryService())
    }
}
