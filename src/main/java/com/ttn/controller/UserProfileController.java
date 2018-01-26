package com.ttn.controller;

import com.ttn.beans.User;
import com.ttn.model.dao.FetchAllTopicsOfUserDao;
import com.ttn.model.service.ServiceInterface.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.Multipart;
import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by user on 7/20/2017.
 */
@Controller
public class UserProfileController {
    @Autowired
    UpdateProfileService updateProfileService;

    @Autowired
    FetchUserInfoOnDashboard fetchUserInfoOnDashboard;
    @Autowired
    FetchAllDetailsOfTopicsOfUserService fetchAllDetailsOfTopicsOfUserService;
    @Autowired
    ShowPostOnUserProfilePageService showPostOnUserProfilePageService;
    @Autowired
    SubscriptionOnDashbard subscriptionOnDashbard;

    @Autowired
    PostCountOnDashboardService postCountOnDashboardService;
    static int userid=0;
    @RequestMapping(value = "/updateUserProfile",method = RequestMethod.POST)
    public @ResponseBody String updateProfilePic(@ModelAttribute User user, @RequestParam("fileupload")MultipartFile userPic,
                                                 HttpServletRequest request,HttpSession session) throws IOException {
        session=request.getSession();
        int userid=Integer.parseInt(session.getAttribute("userid").toString());
        if(updateProfileService.updateProfilePic(user,userPic,userid).equals("updated")) {
            session.setAttribute("uname",user.getUsername());
            return updateProfileService.updateProfilePic(user, userPic, userid);
        }
        else {

            return updateProfileService.updateProfilePic(user, userPic, userid);

        }
    }
    @RequestMapping(value = "/userProfile",method = RequestMethod.GET)
    public ModelAndView profilePage(HttpSession session, HttpServletRequest request)
    {
        session=request.getSession();
        int id=Integer.parseInt(session.getAttribute("userid").toString());
        ModelAndView mav=new ModelAndView("EditProfilePage");
        mav.addObject("userinfo",fetchUserInfoOnDashboard.userInfoService(id));
        return mav;
    }
    @RequestMapping(value = "/updatePassword",method = RequestMethod.POST)
    public @ResponseBody String updatePassword(HttpSession session, HttpServletRequest request,@ModelAttribute User user)
    {
        session=request.getSession();
        int id=Integer.parseInt(session.getAttribute("userid").toString());
        return updateProfileService.updatePassword(user.getPassword(),id);
//        ModelAndView mav=new ModelAndView("dashboard");
//        mav.addObject("userinfo",fetchUserInfoOnDashboard.userInfoService(id));
//        mav.addObject("subscribedTopics",subscriptionOnDashbard.getSubscribedTopics((String)session.getAttribute("uname")));
//        mav.addObject("resources",postCountOnDashboardService.getResources());
//        mav.addObject("username",(String)session.getAttribute("uname"));
//        mav.addObject("firstname",(String)session.getAttribute("uname"));

    }
    @RequestMapping(value = "/userProfilePage",method = RequestMethod.GET)
    public ModelAndView userProfilePage(HttpSession session,HttpServletRequest request)
    {
        ModelAndView modelAndView=new ModelAndView("userProfile");
        session=request.getSession();
        if(session.getAttribute("userid")!=null) {
            userid = (Integer) session.getAttribute("userid");
            modelAndView.addObject("userinfo",fetchUserInfoOnDashboard.userInfoService(userid));
        }else
        {
            modelAndView.addObject("userinfo",fetchUserInfoOnDashboard.userInfoService(userid));

        }
        modelAndView.addObject("profileuser",session.getAttribute("uname").toString());
        modelAndView.addObject("username",session.getAttribute("uname").toString());
        modelAndView.addObject("subscribedTopics",subscriptionOnDashbard.getSubscribedTopics(session.getAttribute("uname").toString()));
        return modelAndView;
    }
    @RequestMapping(value = "/topicsonuserprofilepage",method = RequestMethod.GET)
    public @ResponseBody String getTopicsOnUSerProfilePage(HttpServletRequest request,HttpSession session)
    {
        session=request.getSession();
        String currentUserName=(String)session.getAttribute("uname");
        System.out.println("### "+currentUserName);
        String username=request.getParameter("username");
        System.out.println(request.getParameter("index"));
//        return ""+username+"";
        return fetchAllDetailsOfTopicsOfUserService.getTopicsOfuser(username,currentUserName,Integer.parseInt(request.getParameter("index")));

    }
    @RequestMapping(value = "/postonuserprofilepage",method = RequestMethod.GET)
    public @ResponseBody String getPostOnUserProfilePage(HttpServletRequest request,HttpSession session,
                                                         @RequestParam("username") String username,
                                                         @RequestParam("index") int index)
    {
       return showPostOnUserProfilePageService.getResources(username,index);
    }
    @RequestMapping(value = "/editprofilepage",method = RequestMethod.GET)
    public ModelAndView editProfilePage(HttpSession session,HttpServletRequest request)
    {
        session=request.getSession();
        int userid=Integer.parseInt(session.getAttribute("userid").toString());
        String uname=session.getAttribute("uname").toString();
        String fname=session.getAttribute("fname").toString();
        ModelAndView modelAndView=new ModelAndView("Update");
        modelAndView.addObject("userinfo",fetchUserInfoOnDashboard.userInfoService(userid));
        modelAndView.addObject("username",uname);
        modelAndView.addObject("firstname",fname);
        return modelAndView;
    }
}
