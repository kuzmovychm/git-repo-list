//
//  Repo_ListTests.swift
//  Repo ListTests
//
//  Created by Max Kuzmovych on 01.03.2020.
//  Copyright © 2020 Max Kuzmovych. All rights reserved.
//

import XCTest
@testable import Repo_List

class Repo_ListTests: XCTestCase {
    
    var service: GitHubRepositoryService?
    
    override func setUp() {
        service = GitHubRepositoryService()
    }
        
    func testGitHubRepositoryServiceInit() {
        XCTAssertEqual(service?.gitHubRepositories, [GitHubRepository]())
    }
    
    func testFetchRepository() {
        var repositories: [GitHubRepository]
        service?.fetchRepositories()
        repositories = (service?.gitHubRepositories ?? nil)!
        XCTAssertNotNil(repositories)
    }
    
}
