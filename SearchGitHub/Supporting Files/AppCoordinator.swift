//
//  AppCoordinator.swift
//  SearchGitHub
//
//  Created by Ольга on 20.09.2020.
//  Copyright © 2020 Ольга. All rights reserved.
//

import ReactiveCoordinator
import RxSwift
import RxCocoa

class AppCoordinator: ReactiveCoordinator<Void> {
    
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        
        let viewControler = SearchViewController()
        let navController = UINavigationController(rootViewController: viewControler)
        let searchCoordinator = SearchCoordinator(rootVC: navController.viewControllers[0])
        window.rootViewController = navController
        window.makeKeyAndVisible()
        return coordinate(to: searchCoordinator)
    }
    
}
