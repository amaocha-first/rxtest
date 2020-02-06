//
//  viewModel.swift
//  rxtestApp
//
//  Created by Shota Nishizawa on 2020/02/06.
//  Copyright © 2020 Shota Nishizawa. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelInput {
    var btnTapped: PublishSubject<Void> { get }
}

protocol ViewModelOutput {
    var userNameSubject: PublishSubject<String> { get }
}

final class ViewModel: ViewModelInput, ViewModelOutput {
    private let disposeBag = DisposeBag()
    
    //input
    var btnTapped = PublishSubject<Void>()
    
    //output
    var userNameSubject = PublishSubject<String>()
    
    init() {
        btnTapped.bind(to: Binder(self) {me, _ in
            me.fetchItem()
        })
        .disposed(by: disposeBag)
    }
    
    private func fetchItem() {
        print("API叩く")
        //TODO: - 得られたデータを乗せてイベント発火
        let name = "Jhon"
        
        userNameSubject.onNext(name)
    }
}
