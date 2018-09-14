//
//  LoggedOutViewController.swift
//  Todo
//
//  Created by Marquez on 15/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import SnapKit
import RealmSwift

protocol LoggedOutPresentableListener: class {
    func login(nickName: String)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = UIColor.white
//    }
//
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Welcome"
        
        
        checkLogin()
    }
    
    private func checkLogin() {
//        if let _ = SyncUser.current {
//            // We have already logged in here!
//            self.listener?.login(nickName: "Test")
//        } else {
//            let alertController = UIAlertController(title: "TODO앱에 오신것을 환영합니다.",
//                                                    message: "닉네임을 정해주세요.",
//                                                    preferredStyle: .alert)
//
//            alertController.addAction(UIAlertAction(
//                title: "로그인", style: .default, handler: { [unowned self] alert -> Void in
//                    guard let textField = alertController.textFields?.first,
//                        let text = textField.text else { return }
//                    let creds = SyncCredentials.nickname(text, isAdmin: true)
//
//                    SyncUser.logIn(with: creds, server: Constants.AUTH_URL, onCompletion: { [weak self] (user, err) in
//                        if let _ = user {
//                            self?.listener?.login(nickName: text)
//                        } else if let error = err {
//                            fatalError(error.localizedDescription)
//                        }
//                    })
//            }))
//            alertController.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
//            alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
//                textField.placeholder = "닉네임을 입력해주세요"
//            })
//            self.present(alertController, animated: true, completion: nil)
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        let playerFields = buildPlayerFields()
        buildLoginButton(withPlayer1Field: playerFields.player1Field, player2Field: playerFields.player2Field)
    }
    
    // MARK: - Private
    
    private func buildPlayerFields() -> (player1Field: UITextField, player2Field: UITextField) {
        let player1Field = UITextField()
        player1Field.borderStyle = UITextBorderStyle.line
        view.addSubview(player1Field)
        player1Field.placeholder = "Player 1 name"
        player1Field.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.top.equalTo(self.view).offset(100)
            maker.leading.trailing.equalTo(self.view).inset(40)
            maker.height.equalTo(40)
        }
        
        let player2Field = UITextField()
        player2Field.borderStyle = UITextBorderStyle.line
        view.addSubview(player2Field)
        player2Field.placeholder = "Player 2 name"
        player2Field.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.top.equalTo(player1Field.snp.bottom).offset(20)
            maker.left.right.height.equalTo(player1Field)
        }
        
        return (player1Field, player2Field)
    }
    
    private func buildLoginButton(withPlayer1Field player1Field: UITextField, player2Field: UITextField) {
        let loginButton = UIButton()
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.top.equalTo(player2Field.snp.bottom).offset(20)
            maker.left.right.height.equalTo(player1Field)
        }
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = UIColor.black
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.listener?.login(withPlayer1Name: player1Field.text, player2Name: player2Field.text)
            })
            .disposed(by: disposeBag)
    }
    
    private let disposeBag = DisposeBag()
}
