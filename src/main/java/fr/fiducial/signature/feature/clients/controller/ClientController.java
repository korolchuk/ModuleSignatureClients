package fr.fiducial.signature.feature.clients.controller;

import fr.fiducial.signature.feature.clients.model.Adresse;
import fr.fiducial.signature.feature.clients.model.Habitation;
import fr.fiducial.signature.feature.clients.model.Personne;
import fr.fiducial.signature.feature.clients.model.dto.DocumentDTO;
import fr.fiducial.signature.feature.clients.model.dto.InfoFormulaireDTO;
import fr.fiducial.signature.feature.clients.model.dto.ListePersonneDTO;
import fr.fiducial.signature.feature.clients.model.dto.ClientInfoDTO;
import fr.fiducial.signature.feature.clients.service.AdresseService;
import fr.fiducial.signature.feature.clients.service.HabitationService;
import fr.fiducial.signature.feature.clients.service.PersonneService;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.ClientInfoStatus;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@RestController
@RequestMapping(path = "signature", produces = "application/json")
public class ClientController {
    private final PersonneService personneService;
    private final HabitationService habitationService;

    public ClientController(PersonneService personneService, HabitationService habitationService) {
        this.personneService = personneService;
        this.habitationService = habitationService;
    }

    @GetMapping("/clients")
    public List<ListePersonneDTO> getAll() {
        return personneService.getAll();
    }

    @RequestMapping(value = "/client/{id}", method = GET)
    public ClientInfoDTO getClientInfo(@PathVariable("id") Long id) {
        return personneService.getClientInfo(id);
    }

    @RequestMapping(value = "/client/add", method = POST)
    public ClientInfoDTO createClient(@RequestBody ClientInfoDTO clientDTO) {
        System.out.println("Je passe dans creation client");
        System.out.println(clientDTO);

        // quelques vérifications si valeurs des champs sont correctes
        if (!clientDTO.estValide(true)) {
            return null; // nok, champs ont des valeurs incorrectes
        }

        return personneService.createClient(clientDTO);
    }

    @RequestMapping(value = "/infoFormulaire", method = GET)
    public InfoFormulaireDTO getInfoFormulaire() {
        return personneService.getInfoFormulaire();
    }

    @RequestMapping(value = "/client/{id}/adresses", method = GET)
    public List<Adresse> getAdresse(@PathVariable("id") Long id) {
        return habitationService.getAdressesByClient(id);
    }
}
