//
//  CheckBackupViewController.swift
//  LibraWallet
//
//  Created by palliums on 2019/11/5.
//  Copyright © 2019 palliums. All rights reserved.
//

import UIKit
import Toast_Swift
class CheckBackupViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化本地配置
        self.setBaseControlllerConfig()
        // 加载子View
        self.view.addSubview(self.viewModel.detailView)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewModel.detailView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            } else {
                make.top.bottom.equalTo(self.view)
            }
            make.left.right.equalTo(self.view)
        }
    }
    deinit {
        print("WalletListController销毁了")
    }
    typealias nextActionClosure = (ControllerAction, LibraWalletManager) -> Void
    var actionClosure: nextActionClosure?
    lazy var viewModel: CheckBackupViewModel = {
        let viewModel = CheckBackupViewModel.init()
        viewModel.detailView.delegate = self
        return viewModel
    }()
    var FirstInApp: Bool?
    var tempWallet: CreateWalletModel? {
        didSet {
            self.viewModel.dataArray = tempWallet?.mnemonic
        }
    }
}
extension CheckBackupViewController: CheckBackupViewDelegate {
    func confirmBackup() {
        do {
            try self.viewModel.checkIsAllValid()
            if FirstInApp == true {
                self.view.makeToast("备份成功", duration: 0.5, position: .center, title: nil, image: nil, style: ToastManager.shared.style, completion: { (bool) in
                    let tabbar = BaseTabBarViewController.init()
                    UIApplication.shared.keyWindow?.rootViewController = tabbar
                    UIApplication.shared.keyWindow?.makeKeyAndVisible()
                })
            } else {
                let result = DataBaseManager.DBManager.insertWallet(model: tempWallet!.wallet!)
                self.view.hideToastActivity()
                if result == true {
                    do {
                        try LibraWalletManager().saveMnemonicToKeychain(mnemonic: tempWallet!.mnemonic!, walletRootAddress: tempWallet?.wallet?.walletRootAddress ?? "")
                        try LibraWalletManager().savePaymentPasswordToKeychain(password: tempWallet!.password!, walletRootAddress: tempWallet?.wallet?.walletRootAddress ?? "")
                        self.view.makeToast(localLanguage(keyString: "创建成功"), duration: 1, position: .center, title: nil, image: nil, style: ToastManager.shared.style, completion: { [weak self](bool) in

                            if let vc = UIApplication.shared.keyWindow?.rootViewController {
                                guard vc.children.isEmpty == false else {
                                    return
                                }
                                #warning("有问题待修改")
                                if let tempHome = vc.children.last?.children[1], tempHome.isKind(of: WalletManagerViewController.classForCoder()) {
                                    (tempHome as! WalletManagerViewController).needRefresh = true
                                    self?.navigationController?.popToViewController(tempHome, animated: true)
                                }
                            }
                        })
                    } catch {
                        print(error.localizedDescription)
                        //删除从数据库创建好钱包
                        _ = DataBaseManager.DBManager.deleteWalletFromTable(model: tempWallet!.wallet!)
                    }
                }
            }
        } catch {
            self.view.makeToast(error.localizedDescription,
                                position: .center)
        }
    }
}
