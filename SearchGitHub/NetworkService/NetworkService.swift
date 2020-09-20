//
//  NetworkService.swift
//  SearchGitHub
//
//  Created by Ольга on 19.09.2020.
//  Copyright © 2020 Ольга. All rights reserved.
//

import RxSwift
import RxCocoa

struct NetworkService {
    
    static func repositoriesBy(_ githubID: String) -> Observable<[Repository]> {
      
      let urlString = "https://api.github.com/users/\(githubID)/repos"
      let url = URL(string: urlString)
        
        return Observable.create { (observer) -> Disposable in
            
          let task = URLSession.shared.dataTask(with: url!) { data, _, error in
                
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return
                }
                let jsonDecoder = JSONDecoder()
                do {
                    let comments = try jsonDecoder.decode([Repository].self, from: data)
                    observer.onNext(comments)
      
                } catch {
                    observer.onError(error)
                }
            }
            
            task.resume()
            
            return Disposables.create{
                task.cancel()
            }
        }.retry().map {$0}
    }
}
