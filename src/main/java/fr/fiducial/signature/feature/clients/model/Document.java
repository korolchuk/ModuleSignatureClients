package fr.fiducial.signature.feature.clients.model;
// Generated Mar 1, 2019 11:53:13 AM by Hibernate Tools 5.2.11.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Document generated by hbm2java
 */
@Entity
@Table(name = "document", catalog = "signature_clients")
public class Document implements java.io.Serializable {

	private Long id;
	private Personne personne;
	private String libelle;
	private String categorie;
	private String typeDoc;
	private Date dateEnregistrement;
	private byte[] document;

	public Document() {
	}

	public Document(Personne personne, String libelle, String typeDoc, Date dateEnregistrement, byte[] document) {
		this.personne = personne;
		this.libelle = libelle;
		this.typeDoc = typeDoc;
		this.dateEnregistrement = dateEnregistrement;
		this.document = document;
	}

	public Document(Personne personne, String libelle, String categorie, String typeDoc, Date dateEnregistrement,
			byte[] document) {
		this.personne = personne;
		this.libelle = libelle;
		this.categorie = categorie;
		this.typeDoc = typeDoc;
		this.dateEnregistrement = dateEnregistrement;
		this.document = document;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_client", nullable = false)
	public Personne getPersonne() {
		return this.personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}

	@Column(name = "libelle", nullable = false, length = 200)
	public String getLibelle() {
		return this.libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	@Column(name = "categorie", length = 200)
	public String getCategorie() {
		return this.categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}

	@Column(name = "typeDoc", nullable = false, length = 200)
	public String getTypeDoc() {
		return this.typeDoc;
	}

	public void setTypeDoc(String typeDoc) {
		this.typeDoc = typeDoc;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "dateEnregistrement", nullable = false, length = 19)
	public Date getDateEnregistrement() {
		return this.dateEnregistrement;
	}

	public void setDateEnregistrement(Date dateEnregistrement) {
		this.dateEnregistrement = dateEnregistrement;
	}

	@Column(name = "document", nullable = false)
	public byte[] getDocument() {
		return this.document;
	}

	public void setDocument(byte[] document) {
		this.document = document;
	}
}