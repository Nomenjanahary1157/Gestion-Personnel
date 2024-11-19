# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Fonction(models.Model):
    nom_fonction = models.CharField(unique=True, max_length=255)

    class Meta:
        managed = False
        db_table = 'fonction'


class Corps(models.Model):
    nom_corps = models.CharField(unique=True, max_length=255)

    class Meta:
        managed = False
        db_table = 'corps'


class Qualification(models.Model):
    nom_qualification = models.CharField(max_length=200, blank=True, null=True)
    domaine = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'qualification'


class Direction(models.Model):
    nom_direction = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'direction'


class Personnel(models.Model):
    nom_personnel = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'personnel'


class Position(models.Model):
    nom_position = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'position'


class Personne(models.Model):
    nom_prenoms = models.CharField(max_length=255)
    numéro = models.IntegerField(blank=True, null=True)
    mail = models.CharField(max_length=50, blank=True, null=True)
    login = models.CharField(unique=True, max_length=50)  
    mot_de_passe = models.CharField(max_length=255)       
    im = models.CharField(unique=True, max_length=50, blank=True, null=True)
    idfonction = models.ForeignKey('Fonction', models.DO_NOTHING, db_column='idfonction', blank=True, null=True)
    idcorps = models.ForeignKey('Corps', models.DO_NOTHING, db_column='idcorps', blank=True, null=True)
    idqualification = models.ForeignKey('Qualification', models.DO_NOTHING, db_column='idqualification', blank=True, null=True)
    iddirection = models.ForeignKey('Direction', models.DO_NOTHING, db_column='iddirection', blank=True, null=True)
    idpersonnel = models.ForeignKey('Personnel', models.DO_NOTHING, db_column='idpersonnel', blank=True, null=True)
    idposition = models.ForeignKey('Position', models.DO_NOTHING, db_column='idposition', blank=True, null=True)
    photo = models.CharField(max_length=200, blank=True, null=True)
    cin = models.CharField(unique=True, max_length=50, blank=True, null=True)
    date_entree = models.DateField(blank=True, null=True)
    date_naissance = models.DateField(blank=True, null=True)
    sexe = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'personne'


class Integration(models.Model):
    date_effet = models.DateField(blank=True, null=True)
    ce = models.CharField(max_length=5, blank=True, null=True)
    idpersonne = models.ForeignKey(Personne, models.DO_NOTHING, db_column='idpersonne', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'integration'


class Detachement(models.Model):
    idposition = models.ForeignKey(Position, models.DO_NOTHING, db_column='idposition', blank=True, null=True)
    idpersonnel = models.ForeignKey(Personnel, models.DO_NOTHING, db_column='idpersonnel', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'detachement'


class Migration(models.Model):
    date_migration = models.DateField(blank=True, null=True)
    id_direction_depart = models.ForeignKey(Direction, models.DO_NOTHING, db_column='id_direction_depart', blank=True, null=True)
    id_direction_arrivee = models.ForeignKey(Direction, models.DO_NOTHING, db_column='id_direction_arrivee', related_name='migration_id_direction_arrivee_set', blank=True, null=True)
    id_fonction_depart = models.ForeignKey(Fonction, models.DO_NOTHING, db_column='id_fonction_depart', blank=True, null=True)
    id_fonction_arrivee = models.ForeignKey(Fonction, models.DO_NOTHING, db_column='id_fonction_arrivee', related_name='migration_id_fonction_arrivee_set', blank=True, null=True)
    id_personnel_depart = models.ForeignKey(Personnel, models.DO_NOTHING, db_column='id_personnel_depart', blank=True, null=True)
    id_personnel_arrivee = models.ForeignKey(Personnel, models.DO_NOTHING, db_column='id_personnel_arrivee', related_name='migration_id_personnel_arrivee_set', blank=True, null=True)
    id_personne = models.ForeignKey(Personne, models.DO_NOTHING, db_column='id_personne', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'migration'


class HistoriquePersonne(models.Model):
    id_personne = models.ForeignKey(Personne, models.DO_NOTHING, db_column='id_personne', blank=True, null=True)
    id_fonction = models.ForeignKey(Fonction, models.DO_NOTHING, db_column='id_fonction', blank=True, null=True)
    id_direction = models.ForeignKey(Direction, models.DO_NOTHING, db_column='id_direction', blank=True, null=True)
    date_debut = models.DateField()
    date_fin = models.DateField(blank=True, null=True)
    motif = models.CharField(max_length=255, blank=True, null=True)
    autres_infos = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'historique_personne'
