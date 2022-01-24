//
//  ViewController.swift
//  DataDisplay
//
//  Created by Trevor Steele on 1/23/22.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(GuideCell.self, forCellReuseIdentifier: GuideCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        
        viewModel.delegate = self
        viewModel.getGuideData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.groupedStartDates.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let date = viewModel.groupedStartDates[section]?.first?.startDate ?? Date()
        let header = HeaderView()
        header.configure(with: date)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.groupedStartDates[section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GuideCell.identifier) as! GuideCell
        if let guide = viewModel.groupedStartDates[indexPath.section]?[indexPath.row] {
            cell.configure(with: guide)
            
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: ViewModelDelegate {
    func didGetGuideData() {
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
}



