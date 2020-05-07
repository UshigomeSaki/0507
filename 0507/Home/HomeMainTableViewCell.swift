//
//  HomeMainTableViewCell.swift
//  0507
//
//  Created by ASW-研修１ on 2020/05/07.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit
import PGFramework
protocol HomeMainTableViewCellDelegate: NSObjectProtocol{
}
extension HomeMainTableViewCellDelegate {
}
// MARK: - Property
class HomeMainTableViewCell: BaseTableViewCell {
    weak var delegate: HomeMainTableViewCellDelegate? = nil
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
}
// MARK: - Life cycle
extension HomeMainTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension HomeMainTableViewCell {
}
// MARK: - method
extension HomeMainTableViewCell {
    func setLayout(){
        iconView.layer.cornerRadius = 25
    }
}
