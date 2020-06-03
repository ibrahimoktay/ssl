import ArgumentParser
import Foundation
import SSLCore

struct SSL: ParsableCommand {
    
    static var configuration = CommandConfiguration(
            abstract: "An experimental SSL helper.",
            discussion: """
            Prints to details about SSL certificates of a domain.
            Work in Progress...
            """,
            version: "0.0.1"
    )
    
    @Flag()
    var publicKey: Bool
    
    @Argument()
    var url: String
    
    func validate() throws {
        guard #available(OSX 10.15, *) else {
            throw ValidationError("OS version is not supported.")
        }
        
        if !url.contains("https://") {
            throw ValidationError("Url is not valid. Provide a url with https://...")
        }
    }
    
    func run() throws {
        if #available(OSX 10.15, *) {
            let sslHelper = SSLHelper()
            let certificates = sslHelper.getCertificate(from: url)
            if publicKey {
                Printer.printc(certificates)
            } else {
                Printer.printAll(certificates)
            }
        }
    }
}
SSL.main()
