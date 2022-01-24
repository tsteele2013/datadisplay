//
//  ViewModel.swift
//  DataDisplay
//
//  Created by Trevor Steele on 1/23/22.
//

import Foundation

protocol ViewModelDelegate {
    func didGetGuideData()
}

final class ViewModel: NSObject {
    
    private struct Constants {
        static let apiUrl = URL(string: "https://www.guidebook.com/service/v2/upcomingGuides/")!
    }
    
    private var guides = [Guide]() {
        didSet {
            let uniqueDates = Array(
                Set(
                    guides.map({ return $0.startDate })
                )
            ).sorted(by: { lhs, rhs in
                lhs < rhs
            })
            
            uniqueDates.enumerated().forEach({ i, uniqueDate in
                groupedStartDates[i] = guides.filter { $0.startDate == uniqueDate }
            })
        }
    }
    var delegate: ViewModelDelegate?
    var groupedStartDates: [Int: [Guide]] = [:]
    
    func getGuideData() {
        let task = URLSession.shared.dataTask(with: Constants.apiUrl) { (data, response, error) in
            guard let data = data else { return }
            NSLog(String(data: data, encoding: .utf8)!)
            do {
                let apiResponse: APIResponse = try! JSONDecoder().decode(APIResponse.self, from: data)
                self.guides = apiResponse.data.sorted(by: { lhs, rhs in
                    lhs.startDate < rhs.startDate
                })
                self.delegate?.didGetGuideData()
            }
        }

        task.resume()
    }
}
