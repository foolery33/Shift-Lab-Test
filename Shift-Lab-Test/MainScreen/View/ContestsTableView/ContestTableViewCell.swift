//
//  ContestTableViewCell.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import UIKit
import SnapKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

class ContestTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with contest: ContestModel) {
        self.startTimeLabel.text = contest.startTime
        self.endTimeLabel.text = contest.endTime
        self.contestLabel.text = contest.name
    }
    
    private func setupSubviews() {
        setupContestContentView()
    }
    
    // MARK: - ContestContentView setup
    private lazy var contestContentView: UIView = {
        let myView = UIView()
        return myView
    }()
    private func setupContestContentView() {
        contentView.addSubview(contestContentView)
        setupDateStackView()
        setupContestCardInfoView()
        contestContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - DateStackView setup
    private lazy var dateStackView: UIStackView = {
        let myStackView = UIStackView()
        myStackView.axis = .vertical
        myStackView.spacing = 6
        return myStackView
    }()
    private func setupDateStackView() {
        contestContentView.addSubview(dateStackView)
        setupStartTimeLabel()
        setupEndTimeLabel()
        setupTimeSpacerView()
        dateStackView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
            make.width.equalTo(50)
        }
    }
    
    // MARK: - StartTimeLabel setup
    private lazy var startTimeLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.textColor = R.color.charcoal()
        myLabel.font = R.font.poppinsMedium(size: 17)
        return myLabel
    }()
    private func setupStartTimeLabel() {
        dateStackView.addArrangedSubview(startTimeLabel)
    }
    
    // MARK: - EndTimeLabel setup
    private lazy var endTimeLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.textColor = R.color.softGray()
        myLabel.font = R.font.poppinsMedium(size: 15)
        return myLabel
    }()
    private func setupEndTimeLabel() {
        dateStackView.addArrangedSubview(endTimeLabel)
    }
    
    // MARK: - TimeSpacerView setup
    private lazy var timeSpacerView: UIView = {
        let myView = UIView()
        myView.setContentHuggingPriority(.defaultLow, for: .vertical)
        return myView
    }()
    private func setupTimeSpacerView() {
        dateStackView.addArrangedSubview(timeSpacerView)
    }
    
    // MARK: - ContestCardInfoView setup
    private lazy var contestCardInfoView: UIView = {
        let myView = UIView()
        myView.backgroundColor = R.color.contestBackground()
        myView.layer.cornerRadius = 10
        return myView
    }()
    private func setupContestCardInfoView() {
        contestContentView.addSubview(contestCardInfoView)
        setupContestLabel()
        contestCardInfoView.snp.makeConstraints { make in
            make.leading.equalTo(dateStackView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(dateStackView.snp.top)
            make.bottom.equalToSuperview()
        }   
    }
    
    // MARK: - ContestLabel setup
    private lazy var contestLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.font = R.font.poppinsMedium(size: 21)
        myLabel.textColor = R.color.charcoal()
        myLabel.numberOfLines = 0
        return myLabel
    }()
    private func setupContestLabel() {
        contestCardInfoView.addSubview(contestLabel)
        contestLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(4)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
}

extension ContestTableViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
