package fr.fiducial.signature.feature.clients.model.dto;

import fr.fiducial.signature.feature.clients.model.Document;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DocumentDTO {
    private Long id;
    private Long idClient;
    private String libelle;
    private Long idCategorie;
    private String typeDoc;
    private Date dateEnregistrement;

    public DocumentDTO(Document doc) {
        this.id = doc.getId();
        this.idClient = doc.getPersonne().getId();
        this.idCategorie = (doc.getCategorie() != null ? doc.getCategorie().getId() : null);
        this.libelle = doc.getLibelle();
        this.typeDoc = doc.getTypeDoc();
        this.dateEnregistrement = doc.getDateEnregistrement();
    }
}
