import ArgumentParser
import Foundation

struct SSL: ParsableCommand {
    
    @Argument()
    var url: String
    
    func validate() throws {
        guard #available(OSX 10.15, *) else {
            throw ValidationError("OS version is not supported.")
        }
    }
    
    func run() throws {
        if #available(OSX 10.15, *) {
            let sslHelper = SSLHelper()
            let certificates = sslHelper.getCertificate(from: url)
            Printer.printc(certificates)
        }
    }
}
SSL.main()
