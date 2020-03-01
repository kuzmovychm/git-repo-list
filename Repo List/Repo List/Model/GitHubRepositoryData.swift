//
//  GitHubRepositoryData.swift
//  Repo List
//
//  Created by Max Kuzmovych on 01.03.2020.
//  Copyright © 2020 Max Kuzmovych. All rights reserved.
//

import Foundation

struct GitHubRepository: Codable, Identifiable, Equatable {
    let id: Int
    let name: String?
    let description: String?
}
