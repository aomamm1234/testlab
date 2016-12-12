// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.aa.aa.web;

import com.aa.aa.domain.Hi;
import com.aa.aa.web.HiController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect HiController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String HiController.create(@Valid Hi hi, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hi);
            return "his/create";
        }
        uiModel.asMap().clear();
        hi.persist();
        return "redirect:/his/" + encodeUrlPathSegment(hi.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String HiController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Hi());
        return "his/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String HiController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("hi", Hi.findHi(id));
        uiModel.addAttribute("itemId", id);
        return "his/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String HiController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("his", Hi.findHiEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Hi.countHis() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("his", Hi.findAllHis(sortFieldName, sortOrder));
        }
        return "his/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String HiController.update(@Valid Hi hi, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hi);
            return "his/update";
        }
        uiModel.asMap().clear();
        hi.merge();
        return "redirect:/his/" + encodeUrlPathSegment(hi.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String HiController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Hi.findHi(id));
        return "his/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String HiController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Hi hi = Hi.findHi(id);
        hi.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/his";
    }
    
    void HiController.populateEditForm(Model uiModel, Hi hi) {
        uiModel.addAttribute("hi", hi);
    }
    
    String HiController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
