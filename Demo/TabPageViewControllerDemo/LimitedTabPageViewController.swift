//
//  LimitedTabPageViewController.swift
//  TabPageViewController
//
//  Created by Tomoya Hayakawa on 2017/08/05.
//
//

import UIKit
import TabPageViewController

class LimitedTabPageViewController: TabPageViewController {

    override init() {
        super.init()
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor.white
        tabItems = [(vc1, "First")]
        option.tabWidth = UIScreen.main.bounds.width / CGFloat(tabItems.count)
        option.hidesTopViewOnSwipeType = .all
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "test", style: .plain, target: self, action: #selector(reload))
    }

    @objc func reload() {
        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController")
        tabItems.append((vc2, "second"))

        option.tabWidth = UIScreen.main.bounds.width / CGFloat(tabItems.count)

        self.loadControllers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
