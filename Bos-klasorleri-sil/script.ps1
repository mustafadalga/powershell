$root="C:\";
dir $root -Directory -Recurse -Force| where {-NOT $_.GetFiles("*","AllDirectories")} | del -recurse -Force 




