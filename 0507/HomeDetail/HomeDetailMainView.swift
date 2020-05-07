//
//  HomeDetailMainView.swift
//  0507
//
//  Created by ASW-研修１ on 2020/05/07.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
protocol HomeDetailMainViewDelegate: NSObjectProtocol{
}
extension HomeDetailMainViewDelegate {
}
// MARK: - Property
class HomeDetailMainView: BaseView {
    weak var delegate: HomeDetailMainViewDelegate? = nil
    @IBOutlet weak var descriptionLabel: UILabel!
}
// MARK: - Life cycle
extension HomeDetailMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension HomeDetailMainView {
}
// MARK: - method
extension HomeDetailMainView {
}
