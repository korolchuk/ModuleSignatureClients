package fr.fiducial.signature.feature.clients.service.impl;

import fr.fiducial.signature.feature.clients.dao.DocumentDAO;
import fr.fiducial.signature.feature.clients.dao.PersonneDAO;
import fr.fiducial.signature.feature.clients.model.Document;
import fr.fiducial.signature.feature.clients.model.Personne;
import fr.fiducial.signature.feature.clients.model.dto.DocumentDTO;
import fr.fiducial.signature.feature.clients.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.Optional;

@Service
public class DocumentServiceImpl implements DocumentService {
    private DocumentDAO documentDAO;
    private PersonneDAO personneDAO;

    public DocumentServiceImpl(DocumentDAO documentDAO, PersonneDAO personneDAO) {
        this.documentDAO = documentDAO;
        this.personneDAO = personneDAO;
    }

    @Override
    public Document get(Long id) {
        return null;
    }

    @Override
    public List<DocumentDTO> getDocumentsByClient(Long idClient) {
        return documentDAO.findDocumentsByClient(idClient);

        /*
        // mets à null les liens vers les emplacements des fichiers sur le serveur par sécurité (pas une info à divulger)
        if (documents != null) {
            for (Document doc : documents) {
                doc.setLienVersContenu(null);
            }
        }
        */
    }

    @Override
    public DocumentDTO uploadDocumentForClient(Long idClient, MultipartFile multipartFile, Path documentPath, String relativePath, String libelle, String typeDoc) throws IOException {
        System.out.println("DocumentService uploadDocumentForClient");
        DocumentDTO documentDTO = null;
        Optional<Personne> clientOptional = personneDAO.findById(idClient);
        if (clientOptional.isPresent()) {
            multipartFile.transferTo(documentPath.toFile());
            Document document = new Document(clientOptional.get(), libelle, typeDoc, relativePath);
            document = documentDAO.save(document);
            Long idCategorie = (document.getCategorie() == null ? null : document.getCategorie().getId());
            documentDTO = new DocumentDTO(document.getId(), idClient, document.getLibelle(), idCategorie,
                    document.getTypeDoc(), document.getDateEnregistrement());
        }
        return documentDTO;
    }
}
