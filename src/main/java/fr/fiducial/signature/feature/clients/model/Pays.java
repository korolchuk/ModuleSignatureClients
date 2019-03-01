package fr.fiducial.signature.feature.clients.model;
// Generated Mar 1, 2019 11:53:13 AM by Hibernate Tools 5.2.11.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Pays generated by hbm2java
 */
@Entity
@Table(name = "pays", catalog = "signature_clients")
public class Pays implements java.io.Serializable {

	private Long id;
	private String nom;
	private String nationalite;
//	private Set<Personne> personnes = new HashSet<Personne>(0);
//	private Set<Adresse> adresses = new HashSet<Adresse>(0);
//	private Set<Evenement> evenements = new HashSet<Evenement>(0);

	public Pays() {
	}

	public Pays(String nom, String nationalite) {
		this.nom = nom;
		this.nationalite = nationalite;
	}

	public Pays(String nom, String nationalite, Set<Personne> personnes, Set<Adresse> adresses,
			Set<Evenement> evenements) {
		this.nom = nom;
		this.nationalite = nationalite;
//		this.personnes = personnes;
//		this.adresses = adresses;
//		this.evenements = evenements;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "nom", nullable = false, length = 200)
	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	@Column(name = "nationalite", nullable = false, length = 200)
	public String getNationalite() {
		return this.nationalite;
	}

	public void setNationalite(String nationalite) {
		this.nationalite = nationalite;
	}

//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pays")
//	public Set<Personne> getPersonnes() {
//		return this.personnes;
//	}
//
//	public void setPersonnes(Set<Personne> personnes) {
//		this.personnes = personnes;
//	}
//
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pays")
//	public Set<Adresse> getAdresses() {
//		return this.adresses;
//	}
//
//	public void setAdresses(Set<Adresse> adresses) {
//		this.adresses = adresses;
//	}
//
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pays")
//	public Set<Evenement> getEvenements() {
//		return this.evenements;
//	}
//
//	public void setEvenements(Set<Evenement> evenements) {
//		this.evenements = evenements;
//	}

}
