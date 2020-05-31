import ArgumentParser
import Foundation

struct SSL: ParsableCommand {
    
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
