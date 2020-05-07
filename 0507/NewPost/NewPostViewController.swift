//
//  NewPostViewController.swift
//  0507
//
//  Created by ASW-研修１ on 2020/05/07.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class NewPostViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: NewPostMainView!

    var postModel : PostModel = PostModel()
}
// MARK: - Life cycle
extension NewPostViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        setHeaderView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
// MARK: - Protocol
extension NewPostViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func touchedRightButton(_ sender: UIButton) {
        PostModel.create(request: postModel) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
// MARK: - method
extension NewPostViewController {
    func setHeaderView(){
        headerView.setLeft(text: "＜", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        headerView.setCenter(text: "新規投稿", fontSize: 18, color: #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
        headerView.setRight(text: "シェア", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
    }
}

