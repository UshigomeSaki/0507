//
//  NewPostMainView.swift
//  0507
//
//  Created by ASW-研修１ on 2020/05/07.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
protocol NewPostMainViewDelegate: NSObjectProtocol{
}
extension NewPostMainViewDelegate {
}
// MARK: - Property
class NewPostMainView: BaseView {
    weak var delegate: NewPostMainViewDelegate? = nil
    @IBOutlet weak var textField: UITextField!
}
// MARK: - Life cycle
extension NewPostMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension NewPostMainView {
}
// MARK: - method
extension NewPostMainView {
}
