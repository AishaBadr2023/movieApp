//
//  MoviesListViewController.swift
//  MoviesApp
//
//  Created by soft xpert on 15/06/2023.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var movieListTableView: UITableView! {
        didSet {
            movieListTableView.dataSource = self
            movieListTableView.delegate = self
            movieListTableView.register(UINib.init(nibName: MoviesListConstant.celldentifier, bundle: nil), forCellReuseIdentifier: MoviesListConstant.celldentifier)
        }
    }
    @IBOutlet weak var emptyScreenView: UIImageView!
    // MARK: - Variables
    private var movieList: MoviesList?
    private let refreshControl = UIRefreshControl()
    var isInLoading: Bool = false
    var presenter: MoviesListViewControllerOutput?

    // MARK: - Initialization and Override

    static func instantiate() -> MoviesListViewController? {
        let storyboard = UIStoryboard(name: MoviesListConstant.classidentifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: MoviesListConstant.classidentifier) as? MoviesListViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoaded()
    }
    
    @objc private func refreshData(_ sender: Any) {
        presenter?.refreshData()
    }
}

// MARK: - Extention Protocols
extension MoviesListViewController: MoviesListControllerInput {
    func showEmptyScreen() {
        self.movieListTableView.isHidden = true
        self.emptyScreenView.isHidden = false
    }

    func configureTableView() {
        refreshControl.tintColor = .systemPink
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Movies ..." )
        refreshControl.layer.zPosition = -1
        movieListTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)

    }
    
    func relaodTable(movieList : MoviesList?) {
        if (self.movieList?.results.isEmpty ?? true) {
            self.movieList = movieList
        } else {
            var appendedList = movieList
            appendedList?.results  = (self.movieList?.results ?? [] ) + (movieList?.results ?? [])
            self.movieList = appendedList
        }
        movieListTableView.reloadData()
        refreshControl.endRefreshing()
        isInLoading = false
    }
}
// MARK: - Table delegates

extension MoviesListViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         if indexPath.row == ((movieList?.results.count ?? 0 ) - 3), !isInLoading, (movieList?.isLoadMore ?? false) {
             isInLoading = true
            presenter?.loadMoreData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectMovie(movie: movieList?.results[indexPath.row])
    }
    
}

extension MoviesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesListConstant.celldentifier) as? MovieListTableViewCell
    
        cell?.configureCell(movie: movieList?.results[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}
