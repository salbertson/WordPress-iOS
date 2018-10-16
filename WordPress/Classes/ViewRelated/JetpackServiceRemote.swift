import Foundation

extension JetpackServiceRemote {

    /// Install Jetpack on the specified self-hosted, non-Jetpack site.
    ///
    /// - Parameters:
    ///   - site: String. The URL, including scheme, of the WordPress site.
    ///   - username: String. A user on the site with an administrator role.
    ///   - password: String. The password to the specified user.
    ///   - success: A success block.
    ///   - failure: An error block.
    func installJetpack( site: String, username: String, password: String, success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        // TODO: Remember to test:
        // - single site installs
        // - multi site installs
        // - admin users
        // - non-admin users
        let sanitizedSite = sanitizeAndEncodeURL(site)
        let endpoint = "jetpack-install/" + sanitizedSite
        let path = self.path(forEndpoint: endpoint, withVersion: ._1_0)

        let parameters = [
            "user": username,
            "password": password
            ] as [String: AnyObject]

        wordPressComRestApi.POST(path, parameters: parameters,
                                 success: {
                                    response, _ in
                                    // success is `['status' => true]`

                                    // if response.success == true ...
                                    success()
                                    // else error

        }, failure: {
            error, _ in

            // Errors are SITE_IS_JETPACK, SITE_IS_WPCOM, INVALID_INPUT, or a wperror object
            // if http is used when https is required the error is key: LoginFailureError message: ""
            // Can be throttled

            failure(error)
        })
    }


    /// Sanitize and encodethe Jetpack site's URL
    ///
    /// - Parameter site: A url including scheme
    /// - Returns: A sanitized and encoded url.
    internal func sanitizeAndEncodeURL(_ site: String) -> String {
        // If a scheme is absent add http as a default.
        return (site as NSString).byUrlEncoding()
    }

}
