//
//  DemoObserverPatternViewController.swift
//  CoinMarket
//
//  Created by Toof on 3/30/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import UIKit

protocol Observer {
    var subject: Subject { get set }
    func update()
}

class Subject {
    private var observers: [Observer] = [Observer]()
    private var state: Int?
    
    func getState() -> Int {
        return self.state ?? 0
    }
    
    func setState(newValue: Int) {
        self.state = newValue
        self.notifyAllObservers()
    }
    
    public func subscribe(observer: Observer) {
        self.observers.append(observer)
    }
    
    public func notifyAllObservers() {
        for observer in self.observers {
            observer.update()
        }
    }
}

class Observer1: Observer {
    var subject: Subject
    
    init(subject: Subject) {
        self.subject = subject
//        self.subject.attach(observer: self)
    }
    
    func update() {
        print("Observer 1 is \(self.subject.getState())")
    }
}

class Observer2: Observer {
    var subject: Subject
    
    init(subject: Subject) {
        self.subject = subject
//        self.subject.attach(observer: self)
    }
    
    func update() {
        print("Observer 2 is \(self.subject.getState())")
    }
}

class DemoObserverPatternViewController: BaseViewController {
    // MARK: - Properties
    @IBOutlet weak var textField: UITextField!
    
    let observable: Subject = Subject()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let observer1 = Observer1(subject: self.observable)
        let observer2 = Observer2(subject: self.observable)
        
        self.textField.addTarget(self, action: #selector(editingTextField(_:)), for: .editingChanged)
        
        self.observable.subscribe(observer: observer1)
        self.observable.subscribe(observer: observer2)
    }
    
    @objc
    func editingTextField(_ sender: UITextField) {
        self.observable.setState(newValue: Int(sender.text ?? "0") ?? 0)
    }

}
