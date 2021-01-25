//
//  WalletMessagesCellTableViewCell.swift
//  LibraWallet
//
//  Created by wangyingdong on 2021/1/11.
//  Copyright © 2021 palliums. All rights reserved.
//

import UIKit

class WalletMessagesCellTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(itemIconImageView)
        contentView.addSubview(itemNameLabel)
        contentView.addSubview(itemDateLabel)
        contentView.addSubview(itemDescribeLabel)
        contentView.addSubview(spaceLabel)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("WalletMessagesCellTableViewCell销毁了")
    }
    // MARK: - 布局
    override func layoutSubviews() {
        super.layoutSubviews()
        itemIconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(15)
            make.top.equalTo(contentView).offset(20)
            make.size.equalTo(CGSize.init(width: 14, height: 14))
        }
        itemNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(itemIconImageView)
            make.left.equalTo(itemIconImageView.snp.right).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-80)
        }
        itemDateLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(itemIconImageView)
            make.right.equalTo(contentView.snp.right).offset(-15)
        }
        itemDescribeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(itemIconImageView.snp.right).offset(8)
            make.top.equalTo(itemNameLabel.snp.bottom).offset(12)
            make.right.equalTo(contentView.snp.right).offset(-10)
        }
        spaceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(15)
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.height.equalTo(0.5)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    // MARK: - 懒加载对象
    private lazy var itemIconImageView: UIImageView = {
        let view = UIImageView.init()
        view.image = UIImage.init(named: "wallet_icon_default")
        return view
    }()
    lazy var itemNameLabel: UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.init(hex: "333333")
        label.font = UIFont.systemFont(ofSize: adaptFont(fontSize: 14), weight: UIFont.Weight.regular)
        label.text = "---"
        return label
    }()
    lazy var itemDescribeLabel: UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.init(hex: "999999")
        label.font = UIFont.systemFont(ofSize: adaptFont(fontSize: 12), weight: UIFont.Weight.regular)
        label.text = "---"
        return label
    }()
    lazy var itemDateLabel: UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.right
        label.textColor = UIColor.init(hex: "5C5C5C")
        label.font = UIFont.systemFont(ofSize: adaptFont(fontSize: 12), weight: UIFont.Weight.regular)
        label.text = "---"
        return label
    }()
    lazy var spaceLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = DefaultSpaceColor
        return label
    }()
    // MARK: - 设置数据
    var model: WalletMessagesDataModel? {
        didSet {
            guard let tempModel = model else {
                return
            }
            itemNameLabel.text = tempModel.title
            itemDateLabel.text = timestampToDateString(timestamp: NSDecimalNumber.init(string: tempModel.date).intValue, dateFormat: "MM.dd HH:mm")
            itemDescribeLabel.text = tempModel.body
            if let status = tempModel.readed, status == 0 {
                contentView.backgroundColor = UIColor.init(hex: "FAF7FF")
            } else {
                contentView.backgroundColor = UIColor.white
            }
            if let success = tempModel.status, success == "Executed" {
                itemIconImageView.image = UIImage.init(named: "transaction_detail_finish")
            } else {
                itemIconImageView.image = UIImage.init(named: "transaction_detail_failed")
            }
        }
    }
}
