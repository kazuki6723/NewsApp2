//
//  WebViewController.swift
//  NewsApp1
//
//  Created by 千葉和貴 on 2021/05/07.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(webView)
        
        let urlString = UserDefaults.standard.object(forKey: "url")
        let url = URL(string: urlString as! String)
        let request = URLRequest(url: url!)
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
        configureToolBar()
 
    }
    
    
    func configureToolBar() {

        // ツールバーの高さを直打ち
        let footerBarHeight: CGFloat = 50

        // ツールバーのインスタンス化
        let toolbar = UIToolbar(frame: CGRect(
            x: 0,
            y: self.view.bounds.size.height - footerBarHeight,
            width: self.view.bounds.size.width,
            height: footerBarHeight)
        )

        toolbar.barStyle = .black

        //戻るボタンの実装
        let backButton = UIButton(frame: CGRect(x: 0, y:0, width: 50, height: 50))
        backButton.setTitle("←", for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        let backButtonItem = UIBarButtonItem(customView: backButton)

        //ボタンを左右に分けるためのスペースの実装
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
        target: nil, action: nil)

        //進むボタンの実装
        let nextButton = UIButton(frame: CGRect(x: 0, y:0, width: 50, height: 50))
        nextButton.setTitle("→", for: .normal)
        nextButton.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        let nextButtonItem = UIBarButtonItem(customView: nextButton)
        
        let returnButton = UIButton(frame: CGRect(x: 0, y:0, width: 50, height: 50))
        returnButton.setTitle("閉じる", for: .normal)
        returnButton.addTarget(self, action: #selector(returnAction), for: .touchUpInside)
        let returnButtonItem = UIBarButtonItem(customView: returnButton)

        // ツールバーにアイテムを追加する.
        toolbar.items = [backButtonItem,flexibleItem,returnButtonItem,flexibleItem,nextButtonItem]

        self.view.addSubview(toolbar)
        
        NSLayoutConstraint.activate([
          toolbar.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor),
          toolbar.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
          toolbar.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor),
          toolbar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func back() {
        webView.goBack()
    }
    
    @objc func goToNext() {
        webView.goForward()
    }
    
    @objc func returnAction() {
        webView.removeFromSuperview()
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
