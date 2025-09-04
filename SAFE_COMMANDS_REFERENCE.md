# 🚀 Safe Commands Reference Card
## Prevent Agent Freezing with These Non-Interactive Commands

### 🔧 **Git Commands (Safe, Non-Interactive)**
```bash
# Instead of: git pull (freezes)
gpl                    # Safe git pull with --no-edit --rebase --autostash

# Instead of: git push (freezes)  
gps                    # Safe git push with --no-verify

# Instead of: git status (freezes)
gst                    # Safe git status

# Instead of: git checkout (freezes)
gco                    # Safe git checkout

# Instead of: git branch (freezes)
gbr                    # Safe git branch

# Instead of: git add . (freezes)
gadd                   # Safe git add .

# Instead of: git commit -m (freezes)
gcom "message"         # Safe git commit -m
```

### 📦 **NPM Commands (Safe, Non-Interactive)**
```bash
# Instead of: npm install (freezes)
ni                     # Safe npm install with --yes --no-audit

# Instead of: npm update (freezes)
nu                     # Safe npm update with --yes

# Instead of: npm audit fix (freezes)
na                     # Safe npm audit fix with --yes

# Instead of: npm start (freezes)
ns                     # Safe npm start

# Instead of: npm test (freezes)
nt                     # Safe npm test

# Instead of: npm run (freezes)
nrun script-name       # Safe npm run
```

### 🚀 **Advanced Safe Functions**
```bash
Safe-GitPull           # Enhanced safe git pull with status messages
Safe-NpmInstall        # Enhanced safe npm install with status messages
Safe-NodeStart         # Start Node.js server in background
Safe-GitPush           # Enhanced safe git push with status messages
```

### ⚡ **What These Commands Do**
- **Prevent Interactive Prompts**: No more waiting for user input
- **Skip Security Warnings**: Automatically accept npm security fixes
- **Handle Merge Conflicts**: Git automatically handles simple conflicts
- **Background Processing**: Long-running processes don't block the terminal
- **No More Freezing**: Agent can continue working without manual intervention

### 🔄 **How to Use**
1. **Open any project in Cursor**
2. **Open terminal** (Ctrl + `)
3. **Use the short commands** instead of full commands
4. **No more Shift+Skip needed!**

### 📍 **Where These Are Configured**
- **PowerShell Profile**: `C:\Users\patte\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
- **Cursor Settings**: `C:\Users\patte\AppData\Roaming\Code\User\settings.json`
- **Global Git Config**: `C:\Users\patte\.gitconfig`
- **Global NPM Config**: `C:\Users\patte\.npmrc`

### 🆘 **If Commands Don't Work**
1. **Restart Cursor** to load new settings
2. **Reload PowerShell profile**: `. $PROFILE`
3. **Check if functions exist**: `Get-Command gpl`
4. **Verify Git/NPM configs**: `git config --list` and `npm config list`

---
**Remember**: These commands work in ALL your projects, not just this one!
