//
//  GithubTableViewCell.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import UIKit

class GithubTableViewCell: UITableViewCell {
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoLinkLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /// Bind data into cell
    /// - Parameter data: data from API
    func bindData(data: GithubSearchItem) {
        repoNameLabel.text = data.name
        repoLinkLabel.text = data.htmlURL
    }
}
