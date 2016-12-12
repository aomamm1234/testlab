package com.aa.aa.web;
import com.aa.aa.domain.Delivery;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/deliverys")
@Controller
@RooWebScaffold(path = "deliverys", formBackingObject = Delivery.class)
public class DeliveryController {
}
