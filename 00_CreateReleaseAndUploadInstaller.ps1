param(
    [string]$Tag = "v1.0.0",
    [string]$Title = "Yfarch BIM Pro Tools 2019 v1.0.0",
    [string]$AssetPath = "C:\Users\USER\Documents\Codex\Revit2019\00_91_Releases\YfarchBIMProTools2019_20260527V1.rar"
)

$ErrorActionPreference = "Stop"

$owner = "FusionDraw9257"
$repo = "YfarchBIMProTools2019"
$apiBase = "https://api.github.com/repos/$owner/$repo"

function Convert-SecureStringToPlainText {
    param([System.Security.SecureString]$SecureString)

    $ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString)
    try {
        return [Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr)
    }
    finally {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr)
    }
}

function Invoke-GitHubJson {
    param(
        [string]$Method,
        [string]$Uri,
        [hashtable]$Headers,
        [object]$Body = $null
    )

    if ($null -eq $Body) {
        return Invoke-RestMethod -Method $Method -Uri $Uri -Headers $Headers
    }

    $json = $Body | ConvertTo-Json -Depth 10
    return Invoke-RestMethod -Method $Method -Uri $Uri -Headers $Headers -Body $json -ContentType "application/json"
}

Write-Host ""
Write-Host "=== Create GitHub Release and upload installer ==="
Write-Host ""
Write-Host "Repository:"
Write-Host "  https://github.com/$owner/$repo"
Write-Host "Tag:"
Write-Host "  $Tag"
Write-Host "Asset:"
Write-Host "  $AssetPath"
Write-Host ""

if (-not (Test-Path -LiteralPath $AssetPath)) {
    Write-Host "ERROR: Installer package not found."
    Write-Host "Path: $AssetPath"
    exit 1
}

Write-Host "GitHub token is required to create a release."
Write-Host "Recommended token permission: Contents read/write for this repository."
Write-Host "The token is used only in this PowerShell session and is not saved."
Write-Host ""

$secureToken = Read-Host "Paste GitHub token" -AsSecureString
$token = Convert-SecureStringToPlainText -SecureString $secureToken

if ([string]::IsNullOrWhiteSpace($token)) {
    Write-Host "ERROR: Token is empty."
    exit 1
}

$headers = @{
    Authorization = "Bearer $token"
    Accept = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
    "User-Agent" = "YfarchBIMProTools2019-ReleaseUploader"
}

$release = $null

try {
    Write-Host ""
    Write-Host "Checking existing release..."
    $release = Invoke-GitHubJson -Method "Get" -Uri "$apiBase/releases/tags/$Tag" -Headers $headers
    Write-Host "Release already exists. It will be reused."
}
catch {
    $statusCode = $null
    if ($_.Exception.Response) {
        $statusCode = [int]$_.Exception.Response.StatusCode
    }

    if ($statusCode -ne 404) {
        throw
    }

    Write-Host "Release does not exist. Creating release..."
    $release = Invoke-GitHubJson -Method "Post" -Uri "$apiBase/releases" -Headers $headers -Body @{
        tag_name = $Tag
        name = $Title
        body = @"
Yfarch BIM Pro Tools 2019 release package.

Download the attached installer package and follow the installation instructions in README.md.
"@
        draft = $false
        prerelease = $false
    }
}

$assetName = Split-Path -Leaf $AssetPath

if ($release.assets) {
    $existingAsset = $release.assets | Where-Object { $_.name -eq $assetName } | Select-Object -First 1
    if ($existingAsset) {
        Write-Host ""
        Write-Host "Existing asset found. Deleting old asset:"
        Write-Host "  $assetName"
        Invoke-GitHubJson -Method "Delete" -Uri "$apiBase/releases/assets/$($existingAsset.id)" -Headers $headers | Out-Null
    }
}

$uploadUrl = $release.upload_url -replace "\{\?name,label\}", ""
$encodedName = [System.Uri]::EscapeDataString($assetName)

Write-Host ""
Write-Host "Uploading installer package..."
Invoke-RestMethod `
    -Method Post `
    -Uri "$uploadUrl?name=$encodedName" `
    -Headers $headers `
    -ContentType "application/octet-stream" `
    -InFile $AssetPath | Out-Null

Write-Host ""
Write-Host "Release upload completed."
Write-Host "Open release page:"
Write-Host "https://github.com/$owner/$repo/releases/tag/$Tag"

