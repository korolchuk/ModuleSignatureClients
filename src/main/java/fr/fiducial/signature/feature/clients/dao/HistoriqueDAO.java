package fr.fiducial.signature.feature.clients.dao;

import fr.fiducial.signature.feature.clients.model.Evenement;
import fr.fiducial.signature.feature.clients.model.Historique;
import fr.fiducial.signature.feature.clients.model.Personne;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface HistoriqueDAO extends CrudRepository<Historique, Long>  {
    //TODO à détruire car table de pivot gérée par spring (cf habitation et adresse et personne)
   /* @Query("select h.evenement from Historique h inner join fetch h.evenement, h.personne where h.personne.id= :id_personne")
    Iterable<Evenement> findEvenementsByClient(@Param("id_personne") Long id_personne);

    @Modifying
    @Transactional
    @Query("delete from Historique h where h.personne.id= :id_personne")
    void deleteHistoriqueMatrimonialByClient(@Param("id_personne") Long id_personne);
    */
    @Query("select count(h.evenement) from Historique h where h.personne.id= :id_personne")
    Integer countEvtsByClient(@Param("id_personne") Long id_personne);
}
