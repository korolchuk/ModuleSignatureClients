package fr.fiducial.signature.feature.clients.dao;

import fr.fiducial.signature.feature.clients.model.DivorceRenduPar;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface DivorceRenduParDAO extends CrudRepository<DivorceRenduPar, Long> {
}
