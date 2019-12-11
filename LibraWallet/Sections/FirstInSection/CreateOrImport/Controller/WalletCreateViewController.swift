//
//  WalletCreateViewController.swift
//  LibraWallet
//
//  Created by palliums on 2019/9/12.
//  Copyright © 2019 palliums. All rights reserved.
//

import UIKit

class WalletCreateViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置背景色
        self.view.addSubview(detailView)
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        detailView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self.view)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barStyle = .black
    }
    //子View
    private lazy var detailView : WalletCreateView = {
        let view = WalletCreateView.init()
        view.delegate = self
        return view
    }()
    func checkConfirmLegal() {
        guard getConfirmPrivateAndUseLegalState() == false else {
            return
        }
        let alert = PrivateAlertView.init(openPrivateLegal: {
            let vc = ServiceLegalViewController()
            vc.needDismissViewController = true
            let navi = UINavigationController.init(rootViewController: vc)
            self.present(navi, animated: true, completion: nil)
        }) {
            let vc = PrivateLegalViewController()
            vc.needDismissViewController = true
            let navi = UINavigationController.init(rootViewController: vc)
            self.present(navi, animated: true, completion: nil)
        }

        alert.show()
        guard getWelcomeState() == false else {
            return
        }
//        let alert = WelcomeAlert.init()
//        alert.show()
    }

    deinit {
        print("WalletCreateViewController销毁了")
    }

}
extension WalletCreateViewController: WalletCreateViewDelegate {
    func createWallet() {
        let vc = CreateIdentityWalletViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func importWallet() {
        
        let vc = ImportIdentityWalletViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
