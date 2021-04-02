//
//  GithubViewController.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import UIKit

class GithubViewController: UIViewController {
    @IBOutlet weak var githubTableView: UITableView!
    var viewModel: GithubViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initTableView()
        self.bindViewModel()
    }

    /// Init table view
    private func initTableView() {
        githubTableView.register(UINib(nibName: "GithubTableViewCell", bundle: nil), forCellReuseIdentifier: "GithubTableViewCell")
        githubTableView.delegate = self
        githubTableView.dataSource = self
    }

    /// Bind view model
    private func bindViewModel() {
        viewModel = GithubViewModel()
        viewModel.needReloadTableView = { [weak self] in
            self?.githubTableView.reloadData()
        }

        viewModel.needShowError = { [weak self] error in
            self?.showError(error: error)
        }

        // Request API here
        viewModel.requestRepositories()
    }

    /// Show error alert when call API error
    /// - Parameter error: error from server
    private func showError(error: BaseError) {
        let alert = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension GithubViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GithubTableViewCell") as! GithubTableViewCell
        cell.bindData(data: viewModel.cellForRowAt(indexPath: indexPath))
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
