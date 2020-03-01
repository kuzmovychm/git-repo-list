//
//  ViewController.swift
//  Git Repo App
//
//  Created by Max Kuzmovych on 29.02.2020.
//  Copyright © 2020 Max Kuzmovych. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let repositoryService = RepositoryService()
    let activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryService.delegate = self
        repositoryService.fetchGithubRepositories()
        setUpActivityIndicator()
        
        activityIndicator.startAnimating()
        activityIndicator.stopAnimating()

    }
    
    func setUpActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.gray
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        view.addSubview(activityIndicator)
    }

}

//MARK: - RepositoryServiceDelegate

extension ViewController: RepositoryServiceDelegate {
    func didUpdateGithubRepositories(repositories: Array<GithubRepository>) {
        for repo in repositories {
            print(repo.name ?? "-----NO REPO NAME----")
            print(repo.description ?? "-----NO REPO DESCRIPTOPN----")
            print()
        }
    }
}

