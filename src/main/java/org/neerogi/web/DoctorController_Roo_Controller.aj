// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.neerogi.domain.Consultation;
import org.neerogi.domain.Doctor;
import org.neerogi.domain.Hospital;
import org.neerogi.web.DoctorController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect DoctorController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String DoctorController.create(@Valid Doctor doctor, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, doctor);
            return "doctors/create";
        }
        uiModel.asMap().clear();
        doctor.persist();
        return "redirect:/doctors/" + encodeUrlPathSegment(doctor.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DoctorController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Doctor());
        return "doctors/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String DoctorController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("doctor", Doctor.findDoctor(id));
        uiModel.addAttribute("itemId", id);
        return "doctors/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String DoctorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("doctors", Doctor.findDoctorEntries(firstResult, sizeNo));
            float nrOfPages = (float) Doctor.countDoctors() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("doctors", Doctor.findAllDoctors());
        }
        return "doctors/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String DoctorController.update(@Valid Doctor doctor, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, doctor);
            return "doctors/update";
        }
        uiModel.asMap().clear();
        doctor.merge();
        return "redirect:/doctors/" + encodeUrlPathSegment(doctor.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DoctorController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, Doctor.findDoctor(id));
        return "doctors/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String DoctorController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Doctor doctor = Doctor.findDoctor(id);
        doctor.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/doctors";
    }
    
    void DoctorController.populateEditForm(Model uiModel, Doctor doctor) {
        uiModel.addAttribute("doctor", doctor);
        uiModel.addAttribute("consultations", Consultation.findAllConsultations());
        uiModel.addAttribute("hospitals", Hospital.findAllHospitals());
    }
    
    String DoctorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
