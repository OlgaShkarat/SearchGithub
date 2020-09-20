//
//  ViewController.swift
//  SearchGitHub
//
//  Created by Ольга on 19.09.2020.
//  Copyright © 2020 Ольга. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar { return searchController.searchBar }
    
    var tableView: UITableView!
    let bag = DisposeBag()
    
    var viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureSearchController()
        bind()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func bind() {
        viewModel.data.drive(tableView.rx.items(cellIdentifier: "cell")) { _, repository, cell in
            cell.textLabel?.text = repository.repoName
        }.disposed(by: bag)
        
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: bag)
        
        viewModel.data.asDriver()
            .map { "\($0.count) Repositories" }
            .drive(navigationItem.rx.title)
            .disposed(by: bag)
    }
    
    
    private func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchBar.showsCancelButton = true
        searchBar.text = "OlgaShkarat"
        searchBar.placeholder = "Enter something"
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
}
