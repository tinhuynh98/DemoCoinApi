//
//  NumbersViewController.swift
//  CoinMarket
//
//  Created by Toof on 3/26/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class NumbersViewController: BaseViewController {
    // MARK: - Properties
    @IBOutlet weak var numberTextField1: UITextField!
    @IBOutlet weak var numberTextField2: UITextField!
    @IBOutlet weak var numberTextField3: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.caculator()
    }
    
    fileprivate func caculator() {
//        Observable.combineLatest(self.numberTextField1.rx.text, self.numberTextField2.rx.text, self.numberTextField3.rx.text) { (number1, number2, number3) -> Int in
//            let value1 = Int(number1 ?? "") ?? 0
//            let value2 = Int(number2 ?? "") ?? 0
//            let value3 = Int(number3 ?? "") ?? 0
//
//            return value1 + value2 + value3
//            }
//            .map { (value) -> String in
//                return value.description
//            }
//            .debounce(1.0, scheduler: MainScheduler.instance)
//            .bind(to: self.resultLabel.rx.text)
//            .disposed(by: self.disposeBag)
        
//        self.numberTextField1.rx
//            .text
//            .orEmpty
//            .distinctUntilChanged()
//            .debounce(1.0, scheduler: MainScheduler.instance)
//            .subscribe(onNext: { [unowned self] query in
//            self.resultLabel.text = query
//            }).disposed(by: self.disposeBag)
    }

}
