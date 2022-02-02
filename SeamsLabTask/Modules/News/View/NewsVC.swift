//
//  ViewController.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var viewModel: NewsViewModelProtocol!
    var activityIndicator: ActivityIndicatorStates!
    let refreshControl = UIRefreshControl()

    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Latest News"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.5647058824, blue: 0.6901960784, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator = ActivityIndicator()
        setUpTableView()
        bindViewModelOutput()
        viewModel.didLoad()
    }

    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(identifier: "NewsTableViewCell")
        refreshControl.addTarget(self, action: #selector(refreshTableData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            guard let self = self else {return}
            switch output {
            case .reloadNews:
                self.tableView.reloadData()
            case .showActivityIndicator(let show):
                show ? self.activityIndicator.startAnimating(viewController: self) : self.activityIndicator.stopAnimating()
            case .showError(let error):
                UIAlertController.showAlert(withMessage: error.localizedDescription)
            }
        }
    }

    @objc func refreshTableData() {
        viewModel.output = { [weak self] output in
            guard let self = self else {return}
            switch output {
            case .reloadNews:
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            default:
                break
            }
        }
        viewModel.didLoad()
    }
}

