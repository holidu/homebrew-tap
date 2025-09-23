# Holidu Homebrew Tap

This is a private Homebrew tap for Holidu's command-line tools and utilities.

## Prerequisites

Since this is a **private repository**, you need SSH access to install applications:

1. **SSH Key Setup**: Ensure your SSH key is added to your GitHub account and you have access to the `holidu/homebrew-tap` repository
2. **Test SSH Access**: Verify you can access the repo:
   ```bash
   ssh -T git@github.com
   git ls-remote git@github.com:holidu/homebrew-tap.git
   ```

## Installation

First, add this tap to your Homebrew:

```bash
brew tap holidu/tap git@github.com:holidu/homebrew-tap.git
```

## Available Formulas

### LiteLLM OIDC Proxy

A macOS menu bar application that acts as an OIDC-authenticated proxy for LiteLLM endpoints with integrated Claude Code terminal support.

**Install:**
```bash
brew install --cask litellm-oidc-proxy
```

**Features:**
- OIDC authentication with Keycloak
- Proxy requests to LiteLLM endpoints
- Built-in Claude Code terminal integration
- Session management and analytics
- Request/response logging
- Multiple proxy modes (LiteLLM, Anthropic direct, Custom)
- Desktop notifications for Claude Code hooks
- Model override capabilities per terminal session

**Usage:**
After installation, the app is automatically placed in your Applications folder with proper code signatures preserved.

**IMPORTANT**: Since the app is not notarized, you may need to allow it in Security Settings:

1. **First Launch**: Try launching the app from Applications folder or:
   ```bash
   open /Applications/litellm-oidc-proxy.app
   ```

2. **If blocked**: Go to System Settings > Privacy & Security, find the blocked app message, and click "Open Anyway"

**Note**: The Cask installation preserves all code signatures, preventing the library validation errors that occurred with previous installation methods.

The app will appear in your menu bar. Follow the setup assistant to configure OIDC authentication and proxy settings.

## Requirements

- macOS 12.0 (Monterey) or later
- SSH access to the Holidu GitHub organization
- An OIDC provider (like Keycloak)
- LiteLLM server endpoint (optional, supports direct Anthropic/custom providers too)

## Troubleshooting

### SSH Authentication Issues

If you get permission errors:

1. **Check SSH Agent**: Ensure your SSH key is loaded:
   ```bash
   ssh-add -l
   ```

2. **Add SSH Key**: If not loaded, add it:
   ```bash
   ssh-add ~/.ssh/id_rsa  # or your key path
   ```

3. **Test GitHub Access**: Verify connection:
   ```bash
   ssh -T git@github.com
   # Should show: "Hi username! You've successfully authenticated..."
   ```

4. **Repository Access**: Test repository access:
   ```bash
   git ls-remote git@github.com:holidu/homebrew-tap.git
   ```

### Installation Issues

If `brew install --cask litellm-oidc-proxy` fails:
- Ensure you have access to the private repository
- Try running with verbose output: `brew install --cask -v litellm-oidc-proxy`
- Check Homebrew logs: `brew doctor`

## Support

For issues, feature requests, or questions, please contact the Holidu development team.