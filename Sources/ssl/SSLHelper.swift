//
//  SSLHelper.swift
//  
//
//  Created by ibrahim oktay on 31.05.2020.
//

import Foundation

@available(OSX 10.15, *)
class SSLHelper: NSObject, URLSessionDelegate {
    var urlSession: URLSession!
    var certificates: [SSLCertificateInfo]!
    
    override init() {
        super.init()
        self.urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    }
    
    func getCertificate(from url: String) -> [SSLCertificateInfo] {
        urlSession.dataTask(with: URL(string: url)!).resume()
        CFRunLoopRun()
        return certificates
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        do {
            certificates = try SSLParser.parse(challenge.protectionSpace.serverTrust)
        } catch {

        }
        
        completionHandler(.performDefaultHandling, nil)
        CFRunLoopStop(CFRunLoopGetMain())
    }
    
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        print("errorrr")
    }
}
