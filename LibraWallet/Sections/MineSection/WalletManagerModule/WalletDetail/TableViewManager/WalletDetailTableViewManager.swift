//
//  WalletDetailTableViewManager.swift
//  LibraWallet
//
//  Created by palliums on 2019/10/28.
//  Copyright © 2019 palliums. All rights reserved.
//

import UIKit
protocol WalletDetailTableViewManagerDelegate: NSObjectProtocol {
    func tableViewDidSelectRowAtIndexPath(indexPath: IndexPath)
    func switchButtonValueChange(button: UISwitch)
}
class WalletDetailTableViewManager: NSObject {
    weak var delegate: WalletDetailTableViewManagerDelegate?
    var dataModel: [[[String: String]]]?
    var selectRow: Int?
    deinit {
        print("WalletManagerTableViewManager销毁了")
    }
}
extension WalletDetailTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
                
        self.delegate?.tableViewDidSelectRowAtIndexPath(indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init()
        view.backgroundColor = UIColor.init(hex: "F7F7F9")
        return view
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}
extension WalletDetailTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel?[section].count ?? 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataModel?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = self.dataModel?[indexPath.section][indexPath.row]["CellIdentifier"] ?? "CellNormal"
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? WalletDetailTableViewCell {
            if let data = dataModel, data.isEmpty == false {
                cell.model = data[indexPath.section][indexPath.row]
                if data[indexPath.section].count == 1 || data[indexPath.section].count == (indexPath.row + 1) {
                    cell.spaceLabel.alpha = 0
                }
            }
            cell.delegate = self
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        } else {
            let cell = WalletDetailTableViewCell.init(style: .default, reuseIdentifier: identifier)
            if let data = dataModel, data.isEmpty == false {
                cell.model = data[indexPath.section][indexPath.row]
            }
            cell.delegate = self
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
    }
}
extension WalletDetailTableViewManager: WalletDetailTableViewCellDelegate {
    func switchButtonValueChange(button: UISwitch) {
        self.delegate?.switchButtonValueChange(button: button)
    }
}
