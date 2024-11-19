from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.login_view, name='login'),
    path('acceuil/', views.acceuil_view, name='acceuil'),
    path('userList/', views.users_list, name='userList'),
    path('hierarchie/', views.hierarchie_view, name='hierarchie'),
    path('listeDir/', views.listDir_view, name='listeDir'),
    path('affectation/', views.affect_view, name='affectation'),
    path('detachement/', views.detache_view, name='detachement'),
    path('migration/', views.migration_view, name='migration'),
    path('reclassement/', views.reclassement_view, name='reclassement'),
    path('integration/', views.integration_view, name='integration'),
    path('stat_personnel/', views.statistique_pers_view, name='stat_personnel'),
    path('stat_qualification/', views.statistique_qualification_view, name='stat_qualification'),
    path('stat_enfant/', views.statistique_enfant_view, name='stat_enfant'),
    path('stat_fonction/', views.statistique_fonction_view, name='stat_fonction'),
    path('utilisateur/', views.utilisateur_view, name='utilisateur'),
    path('categorie/', views.categorie_view, name='categorie'),
    path('corps/', views.corps_view, name='corps'),
    path('budget/', views.budget_view, name='budget'),
    path('fonction/', views.fonction_view, name='fonction'),
    path('referentiel/', views.referentiel_view, name='referentiel'),
    path('IA/', views.IA_view, name='IA'),
    path('logout/', views.logout_view, name='logout'),
]
