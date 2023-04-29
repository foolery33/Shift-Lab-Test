//
//  ContestsTableView.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import UIKit

class ContestTableView: UITableView {

    var viewModel: MainScreenViewModel
    
    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero, style: .plain)
        showsVerticalScrollIndicator = false
        backgroundColor = .clear
        dataSource = self
        delegate = self
        separatorStyle = .none
        self.register(ContestTableViewCell.self, forCellReuseIdentifier: ContestTableViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ContestTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.contests.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContestTableViewCell.identifier, for: indexPath) as! ContestTableViewCell
        
        cell.setup(with: self.viewModel.contests[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // MARK: Так API не работает, открыть нужную ссылку я не могу. Поэтому открываю vk.com.
        // MARK: Если бы с сервера приходила ссылка, она лежала бы в viewModel.contests[indexPath.row].link
        if let url = URL(string: "https://vk.com") {
            UIApplication.shared.open(url)
        }
    }
}

extension ContestTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContestTableView.automaticDimension
    }
}
