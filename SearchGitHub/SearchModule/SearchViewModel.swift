//
//  SearchViewModel.swift
//  SearchGitHub
//
//  Created by Ольга on 19.09.2020.
//  Copyright © 2020 Ольга. All rights reserved.
//

import RxSwift
import RxCocoa

class SearchViewModel {
    
    let searchText = BehaviorRelay(value: "")
    
    lazy var data: Driver<[Repository]> = {
        
        return self.searchText.asObservable()
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest(NetworkService.repositoriesBy(_:))
            .asDriver(onErrorJustReturn: [])
    }()

}
