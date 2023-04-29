//
//  MainScreenViewController.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import UIKit
import SnapKit

final class MainScreenViewController: UIViewController {
    
    var viewModel: MainScreenViewModel
    
    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.loadContests()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = R.color.softWhite()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupSubviews() {
        setupGreetingStackView()
        setupContestTableView()
    }
    
    // MARK: - GreetingStackView setup
    private lazy var greetingStackView: UIStackView = {
        let myStackView = UIStackView()
        myStackView.axis = .horizontal
        myStackView.alignment = .center
        myStackView.spacing = 16
        myStackView.layoutMargins = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
        myStackView.isLayoutMarginsRelativeArrangement = true
        myStackView.layer.backgroundColor = R.color.softWhite()?.cgColor
        return myStackView
    }()
    private func setupGreetingStackView() {
        view.addSubview(greetingStackView)
        setupScreenNameLabel()
        setupGreetingButton()
        greetingStackView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
    }
    
    // MARK: - ScreenNameLabel setup
    private lazy var screenNameLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = R.string.mainScreenStrings.recommended_contests()
        myLabel.numberOfLines = 0
        myLabel.font = R.font.poppinsSemiBold(size: 25)
        myLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return myLabel
    }()
    private func setupScreenNameLabel() {
        greetingStackView.addArrangedSubview(screenNameLabel)
    }
    
    // MARK: - GreetingButton setup
    private lazy var greetingButton: FilledButton = {
        let myButton = FilledButton(label: R.string.mainScreenStrings.greeting_button_text(), backColor: R.color.softGreen()!, textColor: R.color.lightGreen()!)
        myButton.addTarget(self, action: #selector(greetUser), for: .touchUpInside)
        myButton.setContentHuggingPriority(.defaultHigh, for: .vertical)
        myButton.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return myButton
    }()
    @objc private func greetUser() {
        self.showAlert(title: R.string.mainScreenStrings.greeting_message(), message: "\(R.string.mainScreenStrings.hello()) \(UserDefaults.standard.value(forKey: "Username") ?? R.string.mainScreenStrings.dear_user()), \(R.string.mainScreenStrings.thanks_message())")
    }
    private func setupGreetingButton() {
        greetingStackView.addArrangedSubview(greetingButton)
    }
    
    // MARK: - ContestTableView setup
    private lazy var contestTableView: ContestTableView = {
        let myTableView = ContestTableView(viewModel: self.viewModel)
        myTableView.backgroundColor = R.color.white()
        myTableView.layer.cornerRadius = 20
        myTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return myTableView
    }()
    private func setupContestTableView() {
        view.addSubview(contestTableView)
        contestTableView.snp.makeConstraints { make in
            make.top.equalTo(greetingStackView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension MainScreenViewController {
    // MARK: Содержимое функции закомментировано, поскольку API не работает. Я решил сделать иммитацию запроса, чтобы показать навык работы с запросами
    func loadContests() {
//        self.viewModel.getContests { success in
//            if success {
//                self.contestTableView.reloadData()
//            }
//            else {
//                self.showAlert(title: R.string.mainScreenStrings.contests_loading_error(), message: self.viewModel.error)
//            }
//        }
    }
}
