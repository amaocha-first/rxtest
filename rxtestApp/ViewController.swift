//
//  ViewController.swift
//  rxtestApp
//
//  Created by Shota Nishizawa on 2020/02/06.
//  Copyright © 2020 Shota Nishizawa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var countBtn: UIButton!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.userNameSubject.bind(to: Binder(self) {me, name in
            me.label.text = name
        })
        .disposed(by: disposeBag)
        
        countBtn.rx.tap.bind(to: viewModel.btnTapped).disposed(by: disposeBag)
    }
}

