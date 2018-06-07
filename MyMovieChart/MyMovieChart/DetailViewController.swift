//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by 이민혁 on 2018. 6. 6..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet var wv: WKWebView! // Deploy target 신경쓰기..10.0 안되네
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var mvo: MovieVO! // 목록 화면에서 전달하는 영화 정보를 받을 변수..
    
    override func viewDidLoad() {
        // WKNavigationDelegate의 델리게이트 객체 지정
        self.wv.navigationDelegate = self
        NSLog("linkurl = \(self.mvo.detail!), title =\(self.mvo.title!)")
        
        let navibar = self.navigationItem
        navibar.title = self.mvo.title
        let url = URL(string: (self.mvo.detail)!)
        let req = URLRequest(url: url!)
        self.wv.load(req)
//        // create URLRequest instance
//        if let url = self.mvo?.detail {
//            if let urlObj = URL(string: url) {
//                let req = URLRequest(url: urlObj)
//                // call loadRequest method.
//                 self.wv.load(req)
//            } else { // URL 형식 오류에 대한 예외처리
//                let alert = UIAlertController(title: "오류", message: "잘못된 URL", preferredStyle: .alert)
//                let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
//                    // 이전 페이지로 돌려보내기
//                        _ = self.navigationController?.popViewController(animated: true)
//                }
//                alert.addAction(cancelAction)
//                self.present(alert, animated: false, completion: nil)
//            }
//        } else {
//            // URL 값이 전달되지 않았을 경우.
//            let alert = UIAlertController(title: "오류", message: "필수 파라미터 누락", preferredStyle: .alert)
//            let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
//                    _ = self.navigationController?.popViewController(animated: true)
//            }
//            alert.addAction(cancelAction)
//            self.present(alert, animated: false, completion: nil)
//        }
        
        
        
    }
    

}

// MARK: - WKNavigationDelegate protocol
extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        // 경고창
        self.alert("상세 페이지를 읽어오지 못했습니다.") {
            // 버튼 클릭시 이전 화면으로 복귀
            _ = self.navigationController?.popViewController(animated: true)
        }
//        let alert = UIAlertController(title: "오류", message: "상세 페이지를 읽어오지 못했습니다", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
//            _ = self.navigationController?.popViewController(animated: true)
//        }
//        alert.addAction(cancelAction)
//        self.present(alert, animated: false, completion: nil)
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        self.alert("상세 페이지를 읽어오지 못했습니다.") {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - simple alert extension
extension UIViewController {
    func alert(_ message: String, onClick: (() -> Void)? = nil) {
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .cancel){ (_) in
            onClick?()
        })
        DispatchQueue.main.async {
            self.present(controller, animated: false)
        }
    }
}
