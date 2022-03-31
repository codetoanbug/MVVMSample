//
//  HomeViewController.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var localButton: UIButton!
    @IBOutlet weak var remoteButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.accessibilityIdentifier = Common.HomeViewControllerId
        self.localButton.accessibilityIdentifier = Common.localButtonId
        self.remoteButton.accessibilityIdentifier = Common.githubButtonId
    }

    /// On Remote Button Touched
    /// - Parameter sender: sender button
    @IBAction func onRemoteButtonTouched(_ sender: Any) {
        let githubViewController = GithubViewController(nibName: "GithubViewController", bundle: nil)
        self.navigationController?.pushViewController(githubViewController, animated: true)
    }
}
