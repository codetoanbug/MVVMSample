//
//  GithubViewController.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import UIKit

class GithubViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var githubTableView: UITableView!
    @IBOutlet weak var topIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var bottomIndicatorView: UIActivityIndicatorView!
    private var viewModel: GithubViewModel!
    private var timer: Timer?
    /// Search with language from textfield
    private var currentLanguage = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sample github search"

        self.bindViewModel()
        self.initTableView()
    }

    /// Init table view
    private func initTableView() {
        // Add delegate for textfield
        searchTextField.delegate = self

        githubTableView.register(UINib(nibName: "GithubTableViewCell", bundle: nil), forCellReuseIdentifier: "GithubTableViewCell")
        githubTableView.delegate = self
        githubTableView.dataSource = self
        githubTableView.tableFooterView = UIView()

        // Hide indicator
        self.topIndicatorView.isHidden = true
        self.bottomIndicatorView.isHidden = true
    }

    /// Bind view model
    private func bindViewModel() {
        viewModel = GithubViewModel()
        viewModel.needReloadTableView = { [weak self] in
            self?.githubTableView.reloadData()
            self?.topIndicatorView.stopAnimating()
            self?.topIndicatorView.isHidden = true
        }

        viewModel.needShowError = { [weak self] error in
            self?.showError(error: error)
            self?.topIndicatorView.stopAnimating()
            self?.topIndicatorView.isHidden = true
        }

        viewModel.needSetStateBottomIndicatorView = { [weak self] show in
            self?.bottomIndicatorView.isHidden = !show
            if show {
                self?.bottomIndicatorView.startAnimating()

            } else {
                self?.bottomIndicatorView.stopAnimating()
            }

        }
    }

    /// Show error alert when call API error
    /// - Parameter error: error from server
    private func showError(error: BaseError) {
        let alert = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    /// Perform search
    private func performSearch() {
        // Not search with same string
        guard let language = searchTextField.text?.trimmingCharacters(in: .whitespaces),
            language != currentLanguage else {
            return
        }
        // Clear text then clear table view
        if language.isEmpty {
            viewModel.clearTableView()
            return
        }

        self.topIndicatorView.isHidden = false
        self.topIndicatorView.startAnimating()

        // Request API here
        viewModel.requestRepositories(language: language)
        
        currentLanguage = language
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

extension GithubViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] timer in
            // search after 0.5 second
            self?.performSearch()
        })

        return true
    }

    // Clear text with button
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        currentLanguage = ""
        viewModel.clearTableView()
        return true
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
