//
//  SessionViewModel.swift
//  WOS Watch App
//
//  Created by Issei Ueda on 2024/03/17.
//

import WatchConnectivity

final class SessionViewModel: NSObject {
    
    //WCSessionのインスタンスを保持する変数を宣言します。これにより、デバイス間の通信セッションを管理します。
    var session: WCSession

    //イニシャライザを定義します。WCSessionのインスタンスを受け取り、デフォルト値としてWCSessio.defaultを使用します。
    init(session: WCSession = .default) {
        
        // 受け取ったセッションインスタンスを、クラスのsessionプロパティに割り当てます。
        self.session = session
        // NSObjectのイニシャライザを呼び出します。
        super.init()
        // このクラスのインスタンスを、sessionのデリゲートとして設定します。
        self.session.delegate = self
        // セッションをアクティブにします。
        session.activate()
    }
}

extension SessionViewModel: WCSessionDelegate {
    
    // WCSessionの状態が変化した時に呼ばれるメソッドを実装します。
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
        // エラーがある場合、そのエラーをログに出力します。
        if let error = error {
            print(error.localizedDescription)
        } else {
            // エラーがなければ、セッションのアクティベーションが完了したことをログに出力します。
            print("The session has completed activation.")
        }
    }
    
}
