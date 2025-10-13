# PowerShell script to rename files in assets/ to snake_case convention
# Run from project root: powershell -ExecutionPolicy Bypass -File rename_assets.ps1

$assetsPath = "ui"

function ConvertToSnakeCase {
    param([string]$fullName)
    
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($fullName)
    $ext = [System.IO.Path]::GetExtension($fullName)
    
    # Replace spaces with underscores
    $baseName = $baseName -replace ' ', '_'
    
    # Insert underscore before uppercase letters that follow lowercase or digit (handle camelCase, avoid after _)
    $baseName = $baseName -creplace '([a-z0-9])([A-Z])', '${1}_$2'
    
    # Remove consecutive underscores
    $baseName = $baseName -replace '__+', '_'
    
    # Lowercase the entire base name
    $baseName = $baseName.ToLower()
    
    return $baseName + $ext
}

# Get all non-.import files recursively in assets/
Get-ChildItem -Path $assetsPath -Recurse -File | 
    Where-Object { $_.Extension -ne '.import' } | 
    ForEach-Object {
        $currentName = $_.Name
        $newName = ConvertToSnakeCase $currentName
        
        if ($newName -ne $currentName) {
            $newFullPath = Join-Path $_.DirectoryName $newName
            $oldFullPath = $_.FullName
            
            # Rename the main file
            Rename-Item -Path $oldFullPath -NewName $newName -ErrorAction Stop
            Write-Host "Renamed: $currentName -> $newName"
            
            # Handle corresponding .import file if it exists
            $oldImportPath = $oldFullPath + '.import'
            $newImportName = $newName + '.import'
            $newImportPath = $newFullPath + '.import'
            
            if (Test-Path $oldImportPath) {
                # Rename the .import file (new name relative to same directory)
                Rename-Item -Path $oldImportPath -NewName $newImportName -ErrorAction Stop
                Write-Host "Renamed import: $($_.Name).import -> $newImportName"
            }
        }
    }

Write-Host "Renaming completed. Check for any errors and refresh Godot project."
