# Scripts pour contrôler l'écran d'accueil de la Patente

L'atelier coopératif [La Patente](https://atelierlapatente.org) à Québec utilise un Raspberry Pi pour gérer l'affichage des évènements sur
l'écran d'accueil.

Les scripts contenus dans ce dossier permettent de démarrer les différents modules d'affichage:

* `diaporama-accueil.sh` démarre le diaporama en utilisant le logiciel `feh` - il doit être exécuté au démarrage (par exemple dans `/etc/xdg/lxsession/LXDE-pi/autostart`)
* `maj-images.sh` remplace les images dans le dossier `/home/ecran/Pictures/EcranAccueil` par celles figurant sur le dossier Google Drive partagé - il doit être exécuté toutes les 30 minutes via cron
* `switchview.sh` bascule de l'affichage de l'agenda sur Chromium vers le diaporama feh - il doit être exécuté toutes les 2 minutes via cron

Voici un exemple de crontab:

```
*/30 * * * * export XAUTHORITY=/home/ecran/.Xauthority; export DISPLAY=:0; bash /home/ecran/ecranpatente/maj-images.sh >> /home/ecran/crontab.log
*/2 * * * * export XAUTHORITY=/home/ecran/.Xauthority; export DISPLAY=:0; bash /home/ecran/ecranpatente/switchview.sh >> /home/ecran/screenchange.log
```

Noter qu'il est important que crontab exécute les scripts en utilisant la session graphique active de l'utilisateur `ecran`. C'est pourquoi
il faut passer les variables d'environnement `XAUTHORITY` et `DISPLAY` tel que ci-dessus.

### Logiciels nécessaires

Les scripts nécessitent les logiciels suivants:

* [feh](https://feh.finalrewind.org/)
* [gdown](https://github.com/wkentaro/gdown)
* xdotool

### Affichage du calendrier

Le calendrier utilise le [script suivant](https://github.com/timtomch/lapatentecal) exécuté sur le site web de la Patente.