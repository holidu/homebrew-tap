cask "litellm-oidc-proxy" do
  version "1.0.27"
  sha256 "f1f093250a0360e4822f6598240d1a4f22b6025347c2e31039db9feb918eb099"

  # GitHub releases from public repository
  url "https://github.com/ohm-s/litellm-oidc-proxy/releases/download/v#{version}/litellm-oidc-proxy-v#{version}.zip"
  name "LiteLLM OIDC Proxy"
  desc "macOS menu bar app that acts as an OIDC-authenticated proxy for LiteLLM endpoints"
  homepage "https://github.com/holidu/litellm-oidc-proxy"

  # Require macOS 12.0 or later
  depends_on macos: ">= :monterey"

  # Standard Cask extraction (no custom installer needed)
  app "litellm-oidc-proxy.xcarchive/Products/Applications/litellm-oidc-proxy.app"

  postflight do
    # Remove quarantine flag automatically
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/litellm-oidc-proxy.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/dev.306.litellm-oidc-proxy.plist",
    "~/Library/Application Support/litellm-oidc-proxy",
    "~/Library/Caches/litellm-oidc-proxy",
  ]

  caveats do
    <<~EOS
      LiteLLM OIDC Proxy v#{version} has been installed to your Applications folder.

      The app will appear in your menu bar and provide an OIDC-authenticated
      proxy for LiteLLM endpoints with integrated Claude Code terminal support.

      Key Features:
      • OIDC authentication with Keycloak and other providers
      • LiteLLM proxy with multi-provider support
      • Built-in Claude Code terminal with session management
      • Comprehensive analytics dashboard with cost tracking
      • Request/response logging with SQL query interface
      • Rate limit management and recovery
      • Multiple proxy modes (LiteLLM, Anthropic direct, Custom)

      Version Information:
      • New versioning scheme: #{version} (version 1.0, build 27)
      • Comprehensive logging system with ~/Library/Logs/ integration
      • Properly signed with Developer ID certificate
      • Native Apple Silicon support

      For setup and configuration, run the app and follow the setup assistant.

      If you get a security warning when launching:
        1. Go to System Settings > Privacy & Security
        2. Look for "litellm-oidc-proxy was blocked" message
        3. Click "Open Anyway"
    EOS
  end
end