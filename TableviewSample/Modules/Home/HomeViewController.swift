//
//  HomeViewController.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    /// On Remote Button Touched
    /// - Parameter sender: sender button
    @IBAction func onRemoteButtonTouched(_ sender: Any) {
        let githubViewController = GithubViewController(nibName: "GithubViewController", bundle: nil)
        self.navigationController?.pushViewController(githubViewController, animated: true)
    }
}
