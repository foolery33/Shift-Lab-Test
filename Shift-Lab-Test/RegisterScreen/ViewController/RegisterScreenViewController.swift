//
//  ViewController.swift
//  Shift-Lab-Test
//
//  Created by admin on 22.04.2023.
//

import UIKit
import SnapKit

final class RegisterScreenViewController: UIViewController {

    var viewModel: RegisterScreenViewModel
    
    init(viewModel: RegisterScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = R.color.white()
        self.view.addKeyboardDismiss()
        setupScrollView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - ScrollView setup
    lazy var scrollView: UIScrollView = {
        let myScrollView = UIScrollView()
        myScrollView.showsVerticalScrollIndicator = false
        return myScrollView
    }()
    private func setupScrollView() {
        view.addSubview(scrollView)
        setupScrollViewContentView()
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    // MARK: - ScrollViewContentView setup
    private lazy var scrollViewContentView: UIView = {
        let myView = UIView()
        return myView
    }()
    private func setupScrollViewContentView() {
        scrollView.addSubview(scrollViewContentView)
        setupGreetingsStackView()
        setupSectionsStackView()
        setupRegisterButton()
        scrollViewContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    // MARK: - GreetingStackView setup
    private lazy var greetingsStackView: UIStackView = {
        let myStackView = UIStackView()
        myStackView.axis = .vertical
        myStackView.spacing = 8
        return myStackView
    }()
    private func setupGreetingsStackView() {
        scrollViewContentView.addSubview(greetingsStackView)
        setupRegisterHeaderLabel()
        setupRegisterPhraseLabel()
        greetingsStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(40)
        }
    }
    
    // MARK: - RegisterHeaderLabel setup
    private lazy var registerHeaderLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = R.string.registerScreenStrings.create_account()
        myLabel.numberOfLines = 0
        myLabel.textColor = R.color.black()
        myLabel.font = R.font.poppinsSemiBold(size: 21)
        return myLabel
    }()
    private func setupRegisterHeaderLabel() {
        greetingsStackView.addArrangedSubview(registerHeaderLabel)
    }
    
    // MARK: - RegisterPhraseLabel setup
    private lazy var registerPhraseLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = R.string.registerScreenStrings.participate_contest()
        myLabel.numberOfLines = 0
        myLabel.textColor = R.color.gray()
        myLabel.font = R.font.poppinsRegular(size: 14)
        return myLabel
    }()
    private func setupRegisterPhraseLabel() {
        greetingsStackView.addArrangedSubview(registerPhraseLabel)
    }
    
    // MARK: - TextFieldsStackView setup
    private lazy var sectionsStackView: UserInfoStack = {
        let myStackView = UserInfoStack(viewModel: self.viewModel)
        myStackView.delegate = self
        return myStackView
    }()
    private func setupSectionsStackView() {
        scrollViewContentView.addSubview(sectionsStackView)
        sectionsStackView.snp.makeConstraints { make in
            make.top.equalTo(greetingsStackView.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - FilledButton setup
    private lazy var registerButton: FilledButton = {
        let myButton = FilledButton(label: R.string.registerScreenStrings.register_button(), backColor: R.color.darkGreen()!, textColor: R.color.white()!)
        myButton.isEnabled = false
        myButton.addTarget(self, action: #selector(onRegisterButtonClicked), for: .touchUpInside)
        return myButton
    }()
    @objc func onRegisterButtonClicked() {
        self.viewModel.onRegisterButtonClicked { success in
            if success {
                // Переход на главный экран
                let mainScreenViewController = MainScreenViewController(
                    viewModel: MainScreenViewModel(
                        contestsRepository: ContestsRepositoryImplementation()
                    )
                )
                self.navigationController?.pushViewController(mainScreenViewController, animated: true)
            }
            else {
                self.showAlert(title: R.string.registerScreenStrings.register_failed(), message: self.viewModel.error)
            }
        }
    }
    private func setupRegisterButton() {
        scrollViewContentView.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(sectionsStackView.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    func turnOnRegisterButton() {
        self.registerButton.isEnabled = self.viewModel.areFieldsFilled()
    }
    
}
