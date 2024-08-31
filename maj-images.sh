#!/bin/bash
pkill feh
rm /home/ecran/Pictures/EcranAccueil/*
/home/ecran/gdown/bin/gdown --fuzzy 'https://drive.google.com/drive/folders/1QggHap8cRbgej-ZTIq37hQr04KKxYXyN?usp=sharing' -O /home/ecran/Pictures/EcranAccueil --folder
bash /home/ecran/ecranpatente/diaporama-accueil.sh