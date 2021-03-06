package fr.fiducial.signature.feature.clients.service.impl;

import fr.fiducial.signature.feature.clients.dao.HistoriqueDAO;
import fr.fiducial.signature.feature.clients.model.Evenement;
import fr.fiducial.signature.feature.clients.model.Historique;
import fr.fiducial.signature.feature.clients.model.Personne;
import fr.fiducial.signature.feature.clients.service.HistoriqueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class HistoriqueServiceImpl implements HistoriqueService {
    // TODO à détruire car table pivot
    private HistoriqueDAO historiqueDAO;

    public HistoriqueServiceImpl(HistoriqueDAO historiqueDAO) {
        this.historiqueDAO = historiqueDAO;
    }

    @Override
    public Historique add(Historique historique) {
        return  historiqueDAO.save(historique);
    }

    @Override
    @Transactional(readOnly=true)
    public Iterable<Evenement> getEvenementsByClient(Personne personne) {
        //TODO
        return null; //historiqueDAO.findEvenementsByClient(personne.getId());
    }

    @Override
    public void deleteHistoriqueMatrimonialByClient(Personne personne) {
        //TODO
        //historiqueDAO.deleteHistoriqueMatrimonialByClient(personne.getId());
    }

    @Override
    public Integer countEvtsByClient(Long id_personne) {
        return historiqueDAO.countEvtsByClient(id_personne);
    }


}
