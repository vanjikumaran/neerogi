// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.neerogi.domain.DrugTreatment;
import org.neerogi.domain.MedicalCondition;
import org.neerogi.domain.ProcedureTreatment;
import org.neerogi.domain.Treatment;
import org.neerogi.web.TreatmentController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect TreatmentController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TreatmentController.create(@Valid Treatment treatment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, treatment);
            return "treatments/create";
        }
        uiModel.asMap().clear();
        treatment.persist();
        return "redirect:/treatments/" + encodeUrlPathSegment(treatment.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TreatmentController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Treatment());
        return "treatments/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TreatmentController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("treatment", Treatment.findTreatment(id));
        uiModel.addAttribute("itemId", id);
        return "treatments/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TreatmentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("treatments", Treatment.findTreatmentEntries(firstResult, sizeNo));
            float nrOfPages = (float) Treatment.countTreatments() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("treatments", Treatment.findAllTreatments());
        }
        return "treatments/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TreatmentController.update(@Valid Treatment treatment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, treatment);
            return "treatments/update";
        }
        uiModel.asMap().clear();
        treatment.merge();
        return "redirect:/treatments/" + encodeUrlPathSegment(treatment.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TreatmentController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, Treatment.findTreatment(id));
        return "treatments/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TreatmentController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Treatment treatment = Treatment.findTreatment(id);
        treatment.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/treatments";
    }
    
    void TreatmentController.populateEditForm(Model uiModel, Treatment treatment) {
        uiModel.addAttribute("treatment", treatment);
        uiModel.addAttribute("drugtreatments", DrugTreatment.findAllDrugTreatments());
        uiModel.addAttribute("medicalconditions", MedicalCondition.findAllMedicalConditions());
        uiModel.addAttribute("proceduretreatments", ProcedureTreatment.findAllProcedureTreatments());
    }
    
    String TreatmentController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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