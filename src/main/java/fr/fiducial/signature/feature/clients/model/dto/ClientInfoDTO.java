package fr.fiducial.signature.feature.clients.model.dto;

import fr.fiducial.signature.feature.clients.model.Adresse;
import fr.fiducial.signature.feature.clients.model.Deces;
import fr.fiducial.signature.feature.clients.model.Pays;
import fr.fiducial.signature.feature.clients.model.Ville;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClientInfoDTO extends PersonneInfo {
    // Attention ne pas changer l'odre des attributs por le constructeur et requête sql !!!!

    private String typeMarital;
    private Boolean estPacse;
    private Date dateModif;
    private Set<Adresse> adresses;
    private Boolean aHistorique = false;
    //private Long idConjoint = null;
    private Date dateLiaison = null;

    // ne pas effacer (pas générable par lombok) et ne changer l'ordre des param car lié à une requête jpql
    public ClientInfoDTO(Long id, String civilite, String nom, String prenoms, String capacite, String statut, String typeMarital,
                         Boolean estPacse, Date dateModif, String telephonePerso, String emailPerso, String clercReferent,
                         String notaireReferent, String commentEmailPerso, String commentTelephonePerso, String emailPro,
                         String commentEmailPro, String telephonePro, String commentTelephonePro, String fax, String commentFax,
                         String siteWeb, String commentSiteWeb, Date dateNaissance, String nationalite, String nomUsuel, String prenomUsuel,
                         String profession, Pays paysNaissance, Ville villeNaissance, String villeEtrangereNaissance) {
        this.id = id;
        this.civilite = civilite;
        this.nom = nom;
        this.prenoms = prenoms;
        this.capacite = capacite;
        this.statut = statut;
        this.typeMarital = typeMarital;
        this.estPacse = estPacse;
        this.dateModif = dateModif;
        this.telephonePerso = telephonePerso;
        this.emailPerso = emailPerso;
        this.clercReferent = clercReferent;
        this.notaireReferent = notaireReferent;
        this.commentEmailPerso = commentEmailPerso;
        this.commentTelephonePerso = commentTelephonePerso;
        this.emailPro = emailPro;
        this.commentEmailPro = commentEmailPro;
        this.telephonePro = telephonePro;
        this.commentTelephonePro = commentTelephonePro;
        this.fax = fax;
        this.commentFax = commentFax;
        this.siteWeb = siteWeb;
        this.commentSiteWeb = commentSiteWeb;
        this.dateNaissance = dateNaissance;
        this.nationalite = nationalite;
        this.nomUsuel = nomUsuel;
        this.prenomUsuel = prenomUsuel;
        this.profession = profession;
        this.paysNaissance = paysNaissance;
        this.villeNaissance = villeNaissance;
        this.villeEtrangereNaissance = villeEtrangereNaissance;
    }

    public Boolean getaHistorique() {
        return aHistorique;
    }

    public void setaHistorique(Boolean aHistorique) {
        this.aHistorique = aHistorique;
    }
}
