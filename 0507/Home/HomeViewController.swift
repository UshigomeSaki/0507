//
//  HomeViewController.swift
//  0507
//
//  Created by ASW-研修１ on 2020/05/07.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class HomeViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    
    @IBOutlet weak var mainView: HomeMainView!
}
// MARK: - Life cycle
extension HomeViewController {
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
    }
}
// MARK: - Protocol
extension HomeViewController :HomeMainViewDelegate{
    func didSelectRowAt(indexPath: IndexPath) {
    }
}

extension HomeViewController:HeaderViewDelegate{
    func touchedRightButton(_ sender: UIButton) {
        let newPostViewController = NewPostViewController()
        newPostViewController.modalPresentationStyle = .fullScreen
        present(newPostViewController, animated: true, completion: nil)
    }
}
// MARK: - method
extension HomeViewController {
    func setHeaderView(){
        headerView.setLeft(text: "")
        headerView.setCenter(text: "Home", fontSize: 18, color: #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
        headerView.setRight(text: "投稿", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
    }
    func setDelegate(){
        mainView.delegate = self
        headerView.delegate = self
    }
}
