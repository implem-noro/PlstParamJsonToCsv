######################################################################
# 処理ID：PlstParamForCheck
# 処理名：プリザンターのパラメータJSONファイルのCSV化（チェック用）
# 処理概要：
# 1. プリザンターのパラメータJSONファイルをCSV化する
######################################################################

######################################################################
# CSVファイル書込用の関数
######################################################################
function WriteCsv($fileName) {
    $flatJsonContent = gron $fileName;
    $searchResult = $flatJsonContent | findstr /v "{} []";
    $replaceResult1 = $searchResult | %{ $_ -replace "json\.", ($fileName + ",")};
    $replaceResult2 = $replaceResult1 | %{ $_ -replace "json\[", ($fileName + ",[")};
    $replaceResult3 = $replaceResult2 | %{ $_ -replace " = ", ","};
    $replaceResult4 = $replaceResult3.TrimEnd(";");
    $replaceResult4 >> C:\work\PlstParamForCheck.csv;
}

######################################################################
# 1. プリザンターのパラメータJSONファイルをCSV化する
######################################################################
'FileName,ParameterName,ParameterValue' > C:\work\PlstParamForCheck.csv;
WriteCsv("Api.json");
WriteCsv("Authentication.json");
# 値がnullのパラメータが書き込まれないため直接書き込む
'Authentication.json,SamlParameters.SPOptions.ServiceCertificates,null' >> C:\work\PlstParamForCheck.csv;
WriteCsv("AutoTestSettings.json");
WriteCsv("BackgroundService.json");
WriteCsv("BackgroundTask.json");
WriteCsv("BinaryStorage.json");
WriteCsv("Dashboard.json");
WriteCsv("Deleted.json");
WriteCsv("General.json");
WriteCsv("GroupMembers.json");
WriteCsv("History.json");
WriteCsv("Locations.json");
WriteCsv("Mail.json");
WriteCsv("Migration.json");
WriteCsv("Mobile.json");
WriteCsv("NavigationMenus.json");
WriteCsv("Notification.json");
WriteCsv("Parameter.json");
WriteCsv("Permissions.json");
WriteCsv("Rds.json");
WriteCsv("Registration.json");
WriteCsv("Reminder.json");
WriteCsv("Script.json");
WriteCsv("Search.json");
WriteCsv("Security.json");
WriteCsv("Service.json");
WriteCsv("Session.json");
WriteCsv("Site.json");
WriteCsv("SitePackage.json");
WriteCsv("SysLog.json");
WriteCsv("User.json");
WriteCsv("Validation.json");
WriteCsv("Version.json");
