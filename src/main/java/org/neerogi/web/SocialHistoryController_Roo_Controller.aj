// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.neerogi.Patient;
import org.neerogi.SocialHistory;
import org.neerogi.web.SocialHistoryController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect SocialHistoryController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SocialHistoryController.create(@Valid SocialHistory socialHistory, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, socialHistory);
            return "socialhistorys/create";
        }
        uiModel.asMap().clear();
        socialHistory.persist();
        return "redirect:/socialhistorys/" + encodeUrlPathSegment(socialHistory.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SocialHistoryController.createForm(Model uiModel) {
        populateEditForm(uiModel, new SocialHistory());
        return "socialhistorys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SocialHistoryController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("socialhistory", SocialHistory.findSocialHistory(id));
        uiModel.addAttribute("itemId", id);
        return "socialhistorys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SocialHistoryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("socialhistorys", SocialHistory.findSocialHistoryEntries(firstResult, sizeNo));
            float nrOfPages = (float) SocialHistory.countSocialHistorys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("socialhistorys", SocialHistory.findAllSocialHistorys());
        }
        return "socialhistorys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SocialHistoryController.update(@Valid SocialHistory socialHistory, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, socialHistory);
            return "socialhistorys/update";
        }
        uiModel.asMap().clear();
        socialHistory.merge();
        return "redirect:/socialhistorys/" + encodeUrlPathSegment(socialHistory.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SocialHistoryController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, SocialHistory.findSocialHistory(id));
        return "socialhistorys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SocialHistoryController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SocialHistory socialHistory = SocialHistory.findSocialHistory(id);
        socialHistory.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/socialhistorys";
    }
    
    void SocialHistoryController.populateEditForm(Model uiModel, SocialHistory socialHistory) {
        uiModel.addAttribute("socialHistory", socialHistory);
        uiModel.addAttribute("patients", Patient.findAllPatients());
    }
    
    String SocialHistoryController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
