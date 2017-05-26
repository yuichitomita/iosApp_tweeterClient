//
//  LoginCommunicator.swift
//  sampleApp
//
//  Created by Tomi on 2017/05/02.
//  Copyright © 2017年 slj. All rights reserved.
//

import Foundation
import Social
import Accounts

struct LoginCommunicator {
    func login (handler: @escaping (Bool) -> ()) {
        // twitterが利用可能かどうかを確認する
        if !SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            handler(false)
            return
        }
    
    // 端末内のアカウントストアを参照
    let store = ACAccountStore()
    let type = store.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
    
    //Twitterのアカウント情報へのアクセスをリクエスト
    store.requestAccessToAccounts(with: type, options: nil) { granted, error in
    
        //承認されなかった場合
        guard granted else {
            handler(false)
            return
        }
    
        //何らかのエラーがあった場合
        if let _ = error {
            handler(false)
            return
        }
    
        let accounts = store.accounts(with: type)
    
        // 複数あるであろうアカウントの中から最初の一つを取得
        if let account = accounts?.first as? ACAccount {
            Account.twitterAccount = account
            handler(true)
        }
    }
 }
}
