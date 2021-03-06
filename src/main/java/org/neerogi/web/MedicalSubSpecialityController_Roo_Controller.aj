// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.neerogi.domain.MedicalCondition;
import org.neerogi.domain.MedicalSpeciality;
import org.neerogi.domain.MedicalSubSpeciality;
import org.neerogi.web.MedicalSubSpecialityController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MedicalSubSpecialityController_Roo_Controller {
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MedicalSubSpecialityController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("medicalsubspeciality", MedicalSubSpeciality.findMedicalSubSpeciality(id));
        uiModel.addAttribute("itemId", id);
        return "medicalsubspecialitys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MedicalSubSpecialityController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("medicalsubspecialitys", MedicalSubSpeciality.findMedicalSubSpecialityEntries(firstResult, sizeNo));
            float nrOfPages = (float) MedicalSubSpeciality.countMedicalSubSpecialitys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("medicalsubspecialitys", MedicalSubSpeciality.findAllMedicalSubSpecialitys());
        }
        return "medicalsubspecialitys/list";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MedicalSubSpecialityController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MedicalSubSpeciality medicalSubSpeciality = MedicalSubSpeciality.findMedicalSubSpeciality(id);
        medicalSubSpeciality.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/medicalsubspecialitys";
    }
    
    String MedicalSubSpecialityController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
