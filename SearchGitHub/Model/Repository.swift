//
//  Repository.swift
//  SearchGitHub
//
//  Created by Ольга on 19.09.2020.
//  Copyright © 2020 Ольга. All rights reserved.
//

import Foundation

struct Repository: Codable {
    
    let repoName: String
    let repoURL: String
    
    enum CodingKeys: String, CodingKey {
          case repoName = "name"
          case repoURL = "html_url"
      }
}
