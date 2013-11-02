// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.neerogi.domain.Doctor;
import org.neerogi.domain.Hospital;
import org.neerogi.web.HospitalController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect HospitalController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String HospitalController.create(@Valid Hospital hospital, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hospital);
            return "hospitals/create";
        }
        uiModel.asMap().clear();
        hospital.persist();
        return "redirect:/hospitals/" + encodeUrlPathSegment(hospital.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String HospitalController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Hospital());
        return "hospitals/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String HospitalController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("hospital", Hospital.findHospital(id));
        uiModel.addAttribute("itemId", id);
        return "hospitals/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String HospitalController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("hospitals", Hospital.findHospitalEntries(firstResult, sizeNo));
            float nrOfPages = (float) Hospital.countHospitals() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("hospitals", Hospital.findAllHospitals());
        }
        return "hospitals/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String HospitalController.update(@Valid Hospital hospital, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hospital);
            return "hospitals/update";
        }
        uiModel.asMap().clear();
        hospital.merge();
        return "redirect:/hospitals/" + encodeUrlPathSegment(hospital.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String HospitalController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, Hospital.findHospital(id));
        return "hospitals/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String HospitalController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Hospital hospital = Hospital.findHospital(id);
        hospital.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/hospitals";
    }
    
    void HospitalController.populateEditForm(Model uiModel, Hospital hospital) {
        uiModel.addAttribute("hospital", hospital);
        uiModel.addAttribute("doctors", Doctor.findAllDoctors());
    }
    
    String HospitalController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
