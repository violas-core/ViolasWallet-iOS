//
//  LoanTableViewHeaderView.swift
//  LibraWallet
//
//  Created by wangyingdong on 2020/8/26.
//  Copyright © 2020 palliums. All rights reserved.
//

import UIKit
protocol LoanTableViewHeaderViewDelegate: NSObjectProtocol {
//    func selectLoanToken(header: LoanTableViewHeaderView)
    func selectTotalBalance(header: LoanTableViewHeaderView, model: BankLoanMarketDataModel)
}
class LoanTableViewHeaderView: UITableViewHeaderFooterView {
    weak var delegate: LoanTableViewHeaderViewDelegate?
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.init(hex: "F7F7F9")
        contentView.addSubview(whiteBackgroundView)
        whiteBackgroundView.addSubview(loanTitleLabel)
        whiteBackgroundView.addSubview(loanTokenIndicatorImageView)
        whiteBackgroundView.addSubview(loanTokenSelectButton)
        whiteBackgroundView.addSubview(loanAmountTextField)
        whiteBackgroundView.addSubview(loanTextfieldSpaceLabel)
        whiteBackgroundView.addSubview(depositBalanceIndicatorImageView)
        whiteBackgroundView.addSubview(LoanLimitAmountTitleLabel)
        whiteBackgroundView.addSubview(loanAmountLabel)
        whiteBackgroundView.addSubview(totalLoanAmountSelectButton)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("LoanTableViewHeaderView销毁了")
    }
    //MARK: - 布局
    override func layoutSubviews() {
        super.layoutSubviews()
        whiteBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView)
            make.left.equalTo(contentView).offset(15)
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.bottom.equalTo(contentView).offset(-10)
        }
        loanTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(whiteBackgroundView).offset(20)
            make.left.equalTo(whiteBackgroundView).offset(14)
        }
        loanTokenIndicatorImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(loanTokenSelectButton)
            make.right.equalTo(loanTokenSelectButton.snp.left).offset(-4)
            make.size.equalTo(CGSize.init(width: 14, height: 14))
        }
        loanTokenSelectButton.snp.makeConstraints { (make) in
            make.top.equalTo(whiteBackgroundView).offset(20)
            make.right.equalTo(whiteBackgroundView.snp.right).offset(-10)
        }
        loanAmountTextField.snp.makeConstraints { (make) in
            make.left.equalTo(whiteBackgroundView).offset(13)
            make.bottom.equalTo(loanTextfieldSpaceLabel.snp.top)
            make.right.equalTo(whiteBackgroundView.snp.right).offset(-12)
            make.height.equalTo(50)
        }
        loanTextfieldSpaceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(whiteBackgroundView).offset(86)
            make.left.equalTo(whiteBackgroundView).offset(13)
            make.right.equalTo(whiteBackgroundView.snp.right).offset(-12)
            make.height.equalTo(0.5)
        }
        depositBalanceIndicatorImageView.snp.makeConstraints { (make) in
            make.top.equalTo(loanTextfieldSpaceLabel.snp.bottom).offset(11)
            make.left.equalTo(whiteBackgroundView).offset(13)
            make.size.equalTo(CGSize.init(width: 12, height: 12))
        }
        LoanLimitAmountTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(depositBalanceIndicatorImageView)
            make.left.equalTo(depositBalanceIndicatorImageView.snp.right).offset(4)
        }
        loanAmountLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(depositBalanceIndicatorImageView)
            make.left.equalTo(LoanLimitAmountTitleLabel.snp.right).offset(5)
        }
        totalLoanAmountSelectButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(depositBalanceIndicatorImageView)
            make.right.equalTo(whiteBackgroundView.snp.right).offset(-12)
        }
    }
    //MARK: - 懒加载对象
    private lazy var whiteBackgroundView: UIView = {
        let view = UIView.init()
        view.layer.backgroundColor = UIColor.white.cgColor
        return view
    }()
    lazy var loanTitleLabel: UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.init(hex: "5C5C5C")
        label.font = UIFont.systemFont(ofSize: adaptFont(fontSize: 12), weight: UIFont.Weight.regular)
        label.text = localLanguage(keyString: "wallet_bank_loan_title")
        return label
    }()
    private lazy var loanTokenIndicatorImageView : UIImageView = {
        let imageView = UIImageView.init()
        imageView.layer.cornerRadius = 7
        imageView.layer.masksToBounds = true
        imageView.image = UIImage.init(named: "wallet_icon_default")
        return imageView
    }()
    lazy var loanTokenSelectButton: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitle("---", for: UIControl.State.normal)
        button.setTitleColor(UIColor.init(hex: "333333"), for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: adaptFont(fontSize: 12), weight: UIFont.Weight.regular)
        button.addTarget(self, action: #selector(buttonClick(button:)), for: UIControl.Event.touchUpInside)
        button.setImage(UIImage.init(named: "cell_detail"), for: UIControl.State.normal)
        button.imagePosition(at: .right, space: 3, imageViewSize: CGSize.init(width: 12, height: 12))
        button.tag = 10
        return button
    }()
    lazy var loanAmountTextField: WYDTextField = {
        let textField = WYDTextField.init()
        textField.textAlignment = NSTextAlignment.left
        textField.textColor = UIColor.init(hex: "333333")
//        textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textField.font = UIFont.init(name: "DIN Alternate Bold", size: 20)
        textField.attributedPlaceholder = NSAttributedString(string: "0.00",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(hex: "C2C2C2"),NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
        textField.keyboardType = .numberPad
        textField.tintColor = DefaultGreenColor
        textField.tag = 20
        return textField
    }()
    lazy var loanTextfieldSpaceLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = DefaultSpaceColor
        return label
    }()
    private lazy var depositBalanceIndicatorImageView : UIImageView = {
        let imageView = UIImageView.init()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.image = UIImage.init(named: "wallet_bank_deposit_balance")
        return imageView
    }()
    lazy var LoanLimitAmountTitleLabel: UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.init(hex: "5C5C5C")
        label.font = UIFont.systemFont(ofSize: adaptFont(fontSize: 10), weight: UIFont.Weight.regular)
        label.text = localLanguage(keyString: "wallet_bank_loan_balance_title")
        return label
    }()
    lazy var loanAmountLabel: UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.init(hex: "5C5C5C")
//        label.font = UIFont.systemFont(ofSize: adaptFont(fontSize: 10), weight: UIFont.Weight.medium)
        label.font = UIFont.init(name: "DIN Alternate Bold", size: 10)
        label.text = "---"
        return label
    }()
    private lazy var totalLoanAmountSelectButton: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitle(localLanguage(keyString: "wallet_bank_repayment_repayment_amount_total_button_title"), for: UIControl.State.normal)
        button.setTitleColor(UIColor.init(hex: "7038FD"), for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: adaptFont(fontSize: 10), weight: UIFont.Weight.regular)
        button.addTarget(self, action: #selector(buttonClick(button:)), for: UIControl.Event.touchUpInside)
        button.tag = 20
        return button
    }()
    @objc func buttonClick(button: UIButton) {
        self.loanAmountTextField.resignFirstResponder()
        if button.tag == 10 {
//            self.delegate?.selectLoanToken(header: self)
        } else {
            guard let model = productModel else {
                return
            }
            self.delegate?.selectTotalBalance(header: self, model: model)
        }
    }
    var productModel: BankLoanMarketDataModel? {
        didSet {
            guard let model = productModel else {
                return
            }
            let amountLimit = getDecimalNumber(amount: NSDecimalNumber.init(value: model.quota_limit ?? 0),
                                               scale: 4,
                                               unit: 1000000)
            let amountLimitLeast = getDecimalNumber(amount: NSDecimalNumber.init(value: model.quota_limit ?? 0).subtracting(NSDecimalNumber.init(value: model.quota_used ?? 0)),
                                                    scale: 4,
                                                    unit: 1000000)
            loanAmountLabel.text = amountLimitLeast.stringValue + "/" + amountLimit.stringValue + " " + (model.token_show_name ?? "")
            if let iconName = model.logo, iconName.isEmpty == false {
                if iconName.hasPrefix("http") {
                    let url = URL(string: iconName)
                    loanTokenIndicatorImageView.kf.setImage(with: url, placeholder: UIImage.init(named: "wallet_icon_default"))
                } else {
                    loanTokenIndicatorImageView.image = UIImage.init(named: iconName)
                }
            } else {
                loanTokenIndicatorImageView.image = UIImage.init(named: "wallet_icon_default")
            }
            loanTokenSelectButton.setTitle(model.token_show_name, for: UIControl.State.normal)
            loanTokenSelectButton.imagePosition(at: .right, space: 3, imageViewSize: CGSize.init(width: 12, height: 12))
        }
    }
}
