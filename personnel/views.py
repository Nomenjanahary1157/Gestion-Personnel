from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.contrib import messages
import logging
import pandas as pd
from django.http import JsonResponse
import os
from django.conf import settings


logger = logging.getLogger(__name__)

def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        logger.info(f"Username entered: {username}")
        logger.info(f"Password entered: {password}")

        if username == "Nomena" and password == "1234":
            messages.success(request, 'Connexion réussie!')
            logger.info("Login successful for user Nomena")
            return redirect('acceuil')
        else:
            messages.error(request, 'Nom d\'utilisateur ou mot de passe incorrect.')
            logger.info("Login failed: incorrect credentials")
            
    return render(request, 'personnel/login.html')

def acceuil_view(request):
    return render(request, 'personnel/acceuil.html') 

def users_list(request):
    file_path = 'LISTE_PERS_MNDPT.xlsx'
    user_data = []
    query = request.GET.get('query', '').lower()

    try:
        # Load Excel data using pandas
        df = pd.read_excel(file_path)
        
        # Print column names to diagnose any issues
        print("Colonnes disponibles :", df.columns)

        # Assuming columns 'NOM&PRENOMS' and 'FONCTION' exist
        df = df[['NOM&PRENOMS', 'FONCTION']].dropna()

        # Filter rows based on the query
        if query:
            filtered_df = df[df['NOM&PRENOMS'].str.lower().str.contains(query)]
        else:
            filtered_df = df

        # Convert the filtered DataFrame to a list of dictionaries
        user_data = filtered_df.to_dict(orient='records')

    except Exception as e:
        print(f"Erreur lors de la récupération des données: {e}")

    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        # Return JSON response for AJAX requests
        return JsonResponse(user_data, safe=False)

    # Render the HTML template with the user data
    return render(request, 'personnel/acceuil.html', {'users': user_data, 'query': query})

def hierarchie_view(request):
    return render(request, 'personnel/hierarchie.html') 

def listDir_view(request):
    return render(request, 'personnel/listeDirection.html') 

def affect_view(request):
    return render(request, 'personnel/affectation.html') 

def detache_view(request):
    return render(request, 'personnel/detachement.html') 

def migration_view(request):
    return render(request, 'personnel/migration.html') 

def reclassement_view(request):
    return render(request, 'personnel/reclassement.html') 

def integration_view(request):
    return render(request, 'personnel/integration.html') 

def statistique_pers_view(request):
    return render(request, 'personnel/stat_personnel.html') 

def statistique_qualification_view(request):
    return render(request, 'personnel/stat_qualification.html') 

def statistique_enfant_view(request):
    return render(request, 'personnel/stat_enfant.html') 

def statistique_fonction_view(request):
    return render(request, 'personnel/stat_fonction.html') 

def IA_view(request):
    return render(request, 'personnel/IA.html') 

def utilisateur_view(request):
    return render(request, 'personnel/utilisateur.html') 

def categorie_view(request):
    return render(request, 'personnel/categorie.html') 

def corps_view(request):
    return render(request, 'personnel/corps.html') 

def budget_view(request):
    return render(request, 'personnel/budget.html') 

def fonction_view(request):
    return render(request, 'personnel/fonction.html') 

def referentiel_view(request):
    return render(request, 'personnel/referentiel.html') 