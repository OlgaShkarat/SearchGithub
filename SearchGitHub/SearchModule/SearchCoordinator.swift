//
//  SearchCoordinator.swift
//  SearchGitHub
//
//  Created by Ольга on 20.09.2020.
//  Copyright © 2020 Ольга. All rights reserved.
//

import RxSwift
import RxCocoa
import ReactiveCoordinator

class SearchCoordinator: ReactiveCoordinator<Void> {
    
    let rootVC: UIViewController
    
    init(rootVC: UIViewController) {
        self.rootVC = rootVC
    }
    
    override func start() -> Observable<Void> {
        let vc = rootVC as! SearchViewController
        let viewModel = SearchViewModel()
        vc.viewModel = viewModel
        
        return Observable.never()
    }
}
