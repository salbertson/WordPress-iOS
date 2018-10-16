import Foundation
import XCTest
@testable import WordPressKit

class JetpackServiceRemoteTests: RemoteTestCase, RESTTestable {

    // MARK: - Properties

    var jetpackEndpoint: String { return "jetpack-install" }

    var remote: JetpackServiceRemote!

    // MARK: - Overridden Methods

    override func setUp() {
        super.setUp()

        remote = JetpackServiceRemote(wordPressComRestApi: getRestApi())
    }


    override func tearDown() {
        super.tearDown()

        remote = nil
    }


    // MARK: - Tests

    func testInstallJetpackSuccess() {

    }

    func testInstallJetpackMultiSiteSuccess() {

    }

    func testInstallJetpackNonAdminUserFailed() {

    }

    func testInstallJetpackNonWPComSiteFailed() {

    }

    func testInstallJetpackExistingJetpackSiteFailed() {

    }

    func testSanitizeAndEncodeURLSuccess() {
        let site = ""
        let sanitizedSite = remote.sanitizeAndEncodeURL(site)
        XCTAssertEqual(sanitizedSite, "")
    }


    func testSanitizeAndEncodeURLMissingScheme() {
        let site = ""
        let sanitizedSite = remote.sanitizeAndEncodeURL(site)
        XCTAssertEqual(sanitizedSite, "")
    }

}
