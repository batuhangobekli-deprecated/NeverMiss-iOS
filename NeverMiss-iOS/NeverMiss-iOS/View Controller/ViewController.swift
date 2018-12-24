//
//  ViewController.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var remaindersTableView: UITableView!
    
    @IBOutlet weak var monthAndMonthDayLabel: UILabel!
    @IBOutlet weak var weekdayNameLabel: UILabel!
    var remainderDataSource = RemainderDataSource(remainderList: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        remaindersTableView.dataSource = remainderDataSource
        remaindersTableView.delegate = remainderDataSource
        getRemainderList()
    }
    func getRemainderList(){
        APIManager().getRemainders(currentViewController: self, context: remaindersTableView).done {json in
            self.remainderDataSource.update(with: json.results!)
            self.remaindersTableView.reloadData()
        }
    }


}


