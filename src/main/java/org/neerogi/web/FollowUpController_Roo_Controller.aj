// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.neerogi.Condition;
import org.neerogi.FollowUp;
import org.neerogi.web.FollowUpController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect FollowUpController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String FollowUpController.create(@Valid FollowUp followUp, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, followUp);
            return "followups/create";
        }
        uiModel.asMap().clear();
        followUp.persist();
        return "redirect:/followups/" + encodeUrlPathSegment(followUp.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String FollowUpController.createForm(Model uiModel) {
        populateEditForm(uiModel, new FollowUp());
        return "followups/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String FollowUpController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("followup", FollowUp.findFollowUp(id));
        uiModel.addAttribute("itemId", id);
        return "followups/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String FollowUpController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("followups", FollowUp.findFollowUpEntries(firstResult, sizeNo));
            float nrOfPages = (float) FollowUp.countFollowUps() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("followups", FollowUp.findAllFollowUps());
        }
        return "followups/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String FollowUpController.update(@Valid FollowUp followUp, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, followUp);
            return "followups/update";
        }
        uiModel.asMap().clear();
        followUp.merge();
        return "redirect:/followups/" + encodeUrlPathSegment(followUp.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String FollowUpController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, FollowUp.findFollowUp(id));
        return "followups/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String FollowUpController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        FollowUp followUp = FollowUp.findFollowUp(id);
        followUp.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/followups";
    }
    
    void FollowUpController.populateEditForm(Model uiModel, FollowUp followUp) {
        uiModel.addAttribute("followUp", followUp);
        uiModel.addAttribute("conditions", Condition.findAllConditions());
    }
    
    String FollowUpController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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