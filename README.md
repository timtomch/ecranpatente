# Scripts pour contrôler l'écran d'accueil de la Patente

L'atelier coopératif [La Patente](https://atelierlapatente.org) à Québec utilise un Raspberry Pi pour gérer l'affichage des évènements sur
l'écran d'accueil.

Les scripts contenus dans ce dossier permettent de démarrer les différents modules d'affichage:

* `diaporama-accueil.sh` démarre le diaporama en utilisant le logiciel `feh` - il doit être exécuté au démarrage (par exemple dans `~/.config/lxsession/LXDE-pi/autostart`)
* `maj-images.sh` remplace les images dans le dossier `/home/pi/Pictures/EcranAccueil` par celles figurant sur le dossier Google Drive partagé - il doit être exécuté toutes les 30 minutes via cron
* `switchview.sh` bascule de l'affichage de l'agenda sur Chromium vers le diaporama feh - il doit être exécuté toutes les 2 minutes via cron

Voici un exemple de crontab:

```
*/30 * * * * bash /home/pi/maj-images.sh >> /home/pi/crontab.log
*/2 * * * * export XAUTHORITY=/home/pi/.Xauthority; export DISPLAY=:0; bash /home/pi/switchview.sh >> /home/pi/screenchange.log
```

### Logiciels nécessaires

Les scripts nécessitent les logiciels suivants:

* [feh](https://feh.finalrewind.org/)
* [gdown](https://github.com/wkentaro/gdown)

### Affichage du calendrier

Le calendrier utilise le [script suivant](https://github.com/timtomch/lapatentecal) exécuté sur le site web de la Patente.