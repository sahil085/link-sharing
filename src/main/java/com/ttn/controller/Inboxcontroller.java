package com.ttn.controller;

import com.ttn.beans.Constants.ResourceType;
import com.ttn.beans.ReadingItem;
import com.ttn.model.service.ServiceInterface.ShowInboxOnDashboardPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by user on 7/16/2017.
 */
@Controller
public class Inboxcontroller {
    @Autowired
    ShowInboxOnDashboardPageService showInboxOnDashboardPageService;
    @RequestMapping(value = "/fetchinbox",method = RequestMethod.GET)
public @ResponseBody String fetchInbox(HttpServletRequest request)
    {
        String username=request.getSession().getAttribute("uname").toString();
      return showInboxOnDashboardPageService.getResources(username,Integer.parseInt(request.getParameter("index"))); }
}
