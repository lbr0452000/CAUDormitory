//
//  ViewController.swift
//  CAUDormitory
//
//  Created by Harrison on 2018. 5. 21..
//  Copyright © 2018년 CAUADC. All rights reserved.
//

import UIKit

class PC:facility {
    override init() {
        super.init()
        super.name_korean = "공용PC"
        super.CellSegueIdentifier = "PC"
        super.icon = UIImage(named: "info_logo_"+super.CellSegueIdentifier)!
    }
}

class PCViewController: AdsViewController {

    @IBOutlet weak var cafeteriaControl: UISegmentedControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet var detail: UILabel!
    
    
    func select308() {
        self.cafeteriaControl.selectedSegmentIndex = 0
        self.detail.text = "휴게실 : 비치 예정\n1층 식당 앞, 2층 휴게실"
    }
    
    func select309() {
        self.cafeteriaControl.selectedSegmentIndex = 1
        self.detail.text = "휴게실 : 홀수 층\n1층 남자기숙사 출입구, 2층 휴게실"
    }
    
    
    @IBAction func cafeteriaControl(_ sender: Any) {
        switch cafeteriaControl.selectedSegmentIndex {
        case 0:
            select308()
        case 1:
            select309()
        default:
            select308()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch settingDormitoryBuilding().read() {
        case 0:
            select308()
        case 1:
            select309()
        default:
            select308()
        }
    }
}
