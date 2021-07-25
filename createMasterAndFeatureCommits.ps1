mkdir test
Set-Location test

#remove git folder if present
IF(Test-Path .git){
	#Write-Output "got git"
	Remove-Item .git -r -fo
	# -r (recursive). Note that -f in PowerShell is ambiguous for -Filter and -Force and thus -fo needs to be used.
	Remove-Item *
} 

git init

#number of commits on the main branch
$numberOfMasterCommitsArray = @("M1", "M2", "M3")
 
for($i = 0; $i -lt $numberOfMasterCommitsArray.length; $i++){ 
	$numberOfMasterCommitsArray[$i] | Out-File $numberOfMasterCommitsArray[$i]
	git add .
	git commit -m $numberOfMasterCommitsArray[$i]
}

git checkout -b feature

#number of commits on the feature branch
$numberOfFeaturesCommitsArray = @("F1", "F2", "F3", "F4")
 
for($i = 0; $i -lt $numberOfFeaturesCommitsArray.length; $i++){ 
	$numberOfFeaturesCommitsArray[$i] | Out-File $numberOfFeaturesCommitsArray[$i]
	git add .
	git commit -m $numberOfFeaturesCommitsArray[$i]
}

#in a separte terminal run this script to view the .git structure updates
#DO
#{
#clear
#tree .git
#Start-Sleep -s 2
#}
#While (1 -eq 1)