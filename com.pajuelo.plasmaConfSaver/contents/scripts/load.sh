
configPath=$1
savePath=$2
dataPath=$3
modelData=$4

if [ -d "$savePath/$modelData/icons" ]; then
    mv $dataPath/icons $dataPath/icons.bak
    cp -r $savePath/$modelData/icons $dataPath    
fi

if [ -d "$savePath/$modelData/color-schemes" ]; then
    mv $dataPath/color-schemes $dataPath/color-schemes.bak
    cp -r $savePath/$modelData/color-schemes $dataPath    
fi

if [ -d "$savePath/$modelData/plasma" ]; then
    mv $dataPath/plasma $dataPath/plasma.bak
    cp -r $savePath/$modelData/plasma $dataPath    
fi

if [ -d "$savePath/$modelData/wallpapers" ]; then
    mv $dataPath/wallpapers $dataPath/wallpapers.bak
    cp -r $savePath/$modelData/wallpapers $dataPath    
fi
                                    

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
mv $configPath/latte $configPath/latte.bak
mv $configPath/autostart $configPath/autostart.bak
cp $savePath/$modelData/lattedockrc $configPath/lattedockrc 
cp -r $savePath/$modelData/latte $configPath
cp -r $savePath/$modelData/autostart $configPath                                    
                                    

                                    
FILE=$savePath/$modelData/latterun


sync
if [ -f "$FILE" ]; then
    killall latte-dock 
    sleep 1 && nohup latte-dock &
else 
    killall latte-dock
fi


qdbus org.kde.KWin /KWin reconfigure 
konsole -e kquitapp5 plasmashell && kstart5 plasmashell --windowclass plasmashell --window Desktop
                                     
                            
