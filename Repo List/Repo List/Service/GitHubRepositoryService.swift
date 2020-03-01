//
//  GitHubRepositoryService.swift
//  Repo List
//
//  Created by Max Kuzmovych on 01.03.2020.
//  Copyright © 2020 Max Kuzmovych. All rights reserved.
//

import Foundation

class GitHubRepositoryService: ObservableObject {
    let REPOSITORIES_URL = "https://api.github.com/orgs/square/repos"
    
    @Published var repositories = [GitHubRepository]()
    
    func fetchRepositories() {
        if let url = URL(string: REPOSITORIES_URL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    if let safeData = data {
                        do {
                            let results = try JSONDecoder().decode([GitHubRepository].self, from: safeData)
                            DispatchQueue.main.async {
                                self.repositories = results
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
