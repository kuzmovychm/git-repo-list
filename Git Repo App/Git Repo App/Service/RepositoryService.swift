//
//  RepositoryService.swift
//  Git Repo App
//
//  Created by Max Kuzmovych on 29.02.2020.
//  Copyright © 2020 Max Kuzmovych. All rights reserved.
//

import Foundation

protocol RepositoryServiceDelegate {
    func didUpdateGithubRepositories(repositories: Array<GithubRepository>)
}

class RepositoryService {
    let REPOS_URL = "https://api.github.com/orgs/square/repos"
    
    var delegate: RepositoryServiceDelegate?
    
    
    func fetchGithubRepositories() {
        if let url = URL(string: REPOS_URL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
                    if let safeRepositories = self.parseJson(repoData: safeData) {
                        self.delegate?.didUpdateGithubRepositories(repositories: safeRepositories)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(repoData: Data) -> Optional<Array<GithubRepository>> {
        do {
            let decodedData = try JSONDecoder().decode([GithubRepository].self, from: repoData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
}
