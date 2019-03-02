package fr.fiducial.signature.feature.clients.model;
// Generated Mar 1, 2019 11:53:13 AM by Hibernate Tools 5.2.11.Final

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Adresse contient un numéro unique non nul, un numéro de voie, un ordre (bis, ter, etc.), le type de voie (rue,
 * avenue, etc.), le nom de la voie, la ville, et le pays.
 */
@Data
@NoArgsConstructor
@Entity
@Table(name = "adresse", catalog = "signature_clients")
public class Adresse implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_pays", nullable = false)
	private Pays pays;

	/*
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_personne", nullable = false)
	private Personne personne;
	*/

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_ville", nullable = false)
	private Ville ville;

	@Column(name = "num")
	private Integer num;

	@Column(name = "ordre_voie", length = 5)
	private String ordreVoie;

	@Column(name = "type_voie", length = 15)
	private String typeVoie;

	@Column(name = "nom_voie", nullable = false, length = 200)
	private String nomVoie;

	@Column(name = "est_principale", nullable = false)
	private boolean estPrincipale;
}