//
//  NGBrowserViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 21/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGBrowserViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var urlToOpen : String = ""
    
    init(url : String){
        super.init(nibName: "NGBrowserViewController", bundle: nil)
        urlToOpen = url
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(self.urlToOpen != ""){
            var websiteUrl : NSURL
            
            if urlToOpen.hasPrefix("http://") || urlToOpen.hasPrefix("https://"){
                websiteUrl = NSURL(string: self.urlToOpen)!
            } else {
                websiteUrl = NSURL(string: "http://%@" + urlToOpen)!
            }
            
            let request : NSURLRequest = NSURLRequest(URL: websiteUrl)
            self.webView?.loadRequest(request)
        }
        

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.webView.stopLoading()
        self.webView.delegate = nil
        self.webView = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        self.navigationItem.title = "Error loading this content"
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.navigationItem.title = webView.stringByEvaluatingJavaScriptFromString("document.title")
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.navigationItem.title = "Loading..."
    }


}
