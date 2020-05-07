//
//  HomeDetailViewController.swift
//  0507
//
//  Created by ASW-研修１ on 2020/05/07.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class HomeDetailViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: HomeDetailMainView!
    
    var postModel : PostModel = PostModel()
}
// MARK: - Life cycle
extension HomeDetailViewController {
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
        getModel()
        updateLabel()
    }
}
// MARK: - Protocol
extension HomeDetailViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
    func touchedRightButton(_ sender: UIButton) {
        let editViewController = EditViewController()
        editViewController.postModel = postModel
        editViewController.modalPresentationStyle = .fullScreen
        present(editViewController, animated: true, completion: nil)
        
    }
}
// MARK: - method
extension HomeDetailViewController {
    func setHeaderView(){
        headerView.setLeft(text: "＜", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        headerView.setCenter(text: "投稿詳細", fontSize: 18, color: #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
        headerView.setRight(text: "編集", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
    }
    func updateLabel(){
        mainView.descriptionLabel.text = postModel.description
    }
    func getModel(){
        PostModel.readAt(id: postModel.id, success: { (postModel) in
            self.postModel = postModel
        }) {
            self.navigationController?.popViewController(animated: true)
            self.animatorManager.navigationType = .slide_pop
        }
    }
}

