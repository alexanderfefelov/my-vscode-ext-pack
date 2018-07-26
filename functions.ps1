function Install($ExtensionId) {
    code --install-extension $ExtensionId
}

function Uninstall($ExtensionId) {
    code --uninstall-extension $ExtensionId
}

function JustDoIt($Action) {
    foreach ($line in Get-Content .\extensions.dat) {
        $s = $line.Trim()
        if (($s.Length -gt 0) -and -not ($s.StartsWith("#"))) {
            &$Action -ExtensionId $s
        }
    }
}
