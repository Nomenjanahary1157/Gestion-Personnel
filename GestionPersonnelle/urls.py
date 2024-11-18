from django.contrib import admin
from django.urls import path, include
from django.shortcuts import redirect

from personnel.views import IA_view, acceuil_view, affect_view, budget_view, categorie_view, corps_view, detache_view, fonction_view, hierarchie_view, integration_view, listDir_view, login_view, migration_view, reclassement_view, referentiel_view, statistique_enfant_view, statistique_fonction_view, statistique_pers_view, statistique_qualification_view, users_list, utilisateur_view

urlpatterns = [
    path('admin/', admin.site.urls),
    path('gestionpersonnelMNDPT/personnel/', include('personnel.urls')),
    path('gestionpersonnelMNDPT/personnel/accueil/', acceuil_view, name='accueil'),
    path('gestionpersonnelMNDPT/personnel/userList/', users_list, name='list'),
    path('gestionpersonnelMNDPT/personnel/hierarchie/', hierarchie_view, name='hierarchie'),
    path('gestionpersonnelMNDPT/personnel/listDir/', listDir_view, name='listDir'),
    path('gestionpersonnelMNDPT/personnel/affectation/', affect_view, name='affectation'),
    path('gestionpersonnelMNDPT/personnel/detachement/', detache_view, name='detachement'),
    path('gestionpersonnelMNDPT/personnel/migration/', migration_view, name='migration'),
    path('gestionpersonnelMNDPT/personnel/reclassement/', reclassement_view, name='reclassement'),
    path('gestionpersonnelMNDPT/personnel/integration/', integration_view, name='integration'),
    path('gestionpersonnelMNDPT/personnel/stat_personnel/', statistique_pers_view, name='stat_personnel'),
    path('gestionpersonnelMNDPT/personnel/stat_qualification/', statistique_qualification_view, name='stat_qualification'),
    path('gestionpersonnelMNDPT/personnel/stat_enfant/', statistique_enfant_view, name='stat_enfant'),
    path('gestionpersonnelMNDPT/personnel/statistique_pers/', statistique_fonction_view, name='stat_fonction'),
    path('gestionpersonnelMNDPT/personnel/IA/', IA_view, name='IA'),
    
    path('gestionpersonnelMNDPT/personnel/utilisateur/', utilisateur_view, name='utilisateur'),
    path('gestionpersonnelMNDPT/personnel/categorie/', categorie_view, name='categorie'),
    path('gestionpersonnelMNDPT/personnel/corps/', corps_view, name='corps'),
    path('gestionpersonnelMNDPT/personnel/budget/', budget_view, name='budget'),
    path('gestionpersonnelMNDPT/personnel/fonction/', fonction_view, name='fonction'),
    path('gestionpersonnelMNDPT/personnel/referentiel/', referentiel_view, name='referentiel'),
    
    path('', lambda request: redirect(login_view)),  
]
