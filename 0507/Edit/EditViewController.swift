//
//  EditViewController.swift
//  0507
//
//  Created by ASW-研修１ on 2020/05/07.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class EditViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: EditMainView!
    
    var postModel : PostModel = PostModel()
}
// MARK: - Life cycle
extension EditViewController {
    override func loadView() {
        super.loadView()
        setHeaderView()
        setDelegate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        giveModel()
    }
}
// MARK: - Protocol
extension EditViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func touchedRightButton(_ sender: UIButton) {
        if let text = mainView.textView.text{
            postModel.description = text
        }
        PostModel.update(request: postModel) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension EditViewController:EditMainViewDelegate{
    func touchedDeleteButton() {
        PostModel.delete(id: postModel.id) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
// MARK: - method
extension EditViewController {
    func giveModel(){
        mainView.updateView(postModel: postModel)
    }
    func setHeaderView(){
        headerView.setLeft(text: "キャンセル", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        headerView.setCenter(text: "編集", fontSize: 18, color: #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
        headerView.setRight(text: "完了", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
}

