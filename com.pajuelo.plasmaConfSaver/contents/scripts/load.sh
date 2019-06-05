
configPath=$1
savePath=$2
dataPath=$3
modelData=$4

mv $configPath/plasma-org.kde.plasma.desktop-appletsrc $configPath/plasma-org.kde.plasma.desktop-appletsrc.bak
mv $configPath/.config/plasmarc $configPath/.config/plasmarc.bak
mv $configPath/.config/plasmashellrc $configPath/.config/plasmashellrc.bak
cp $savePath/$modelData/plasma-org.kde.plasma.desktop-appletsrc $configPath/plasma-org.kde.plasma.desktop-appletsrc
cp $savePath/$modelData/plasmarc $configPath/plasmarc
cp $savePath/$modelData/plasmashellrc $configPath/plasmashellrc
cp $savePath/$modelData/kdeglobals $configPath/kdeglobals
                                    
                                    
cp $savePath/$modelData/kwinrc $configPath/kwinrc
cp $savePath/$modelData/kwinrulesrc $configPath/kwinrulesrc
                                    
                                    
mv $configPath/lattedockrc $configPath/lattedockrc.bak
mv $configPath/latte $configPath/latte.bak/
cp $savePath/$modelData/lattedockrc $configPath/lattedockrc 
cp -r $savePath/$modelData/latte $configPath/latte
                                    
                                    
mv $dataPath/plasma $dataPath/plasma.bak/
cp -r $savePath/$modelData/plasma $dataPath/plasma
                                    
                                    
mv $dataPath/wallpapers $dataPath/wallpapers.bak/
cp -r $savePath/$modelData/wallpapers $dataPath/wallpapers
                                    
ls $savePath/$modelData/latterun|grep -i latterun

qdbus org.kde.KWin /KWin reconfigure 
kquitapp5 plasmashell && kstart5 plasmashell
                                     
                            