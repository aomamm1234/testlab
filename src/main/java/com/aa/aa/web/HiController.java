package com.aa.aa.web;
import com.aa.aa.domain.Hi;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/his")
@Controller
@RooWebScaffold(path = "his", formBackingObject = Hi.class)
public class HiController {
}
