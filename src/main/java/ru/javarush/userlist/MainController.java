package ru.javarush.userlist;

import com.google.common.collect.Lists;
import javafx.application.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.javarush.userlist.entity.UserEntity;
import ru.javarush.userlist.service.UserService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Анатолий Гостев on 20.10.2016.
 */
@Controller
public class MainController {
    @Autowired
    UserService userService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ModelAndView ormFindAllUsers(@RequestParam(value = "search", required = false) String search) {
        System.out.println("ORMController ormFindAllUsers is called");
        List<UserEntity> users;
        if(search != null)
            users = userService.searchByName(search);
        else users = userService.findAllUsers();
        return new ModelAndView("users", "users", users);
    }
    /*public String findAllUsers(@RequestParam(value = "search", required = false) String search,
                               Model model) {
        List<UserEntity> users;
        if(search != null)
            users = userService.searchByName(search);
        else users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "users";
    }*/

    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String getAddPage(Model model) {
        model.addAttribute("userAttribute", new UserEntity());
        return "adduser";
    }
    /*public ModelAndView getAddPage() {
        return new ModelAndView("adduser", "user", new UserEntity());
    }*/

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("userAttribute") UserEntity user) {
        //user.setId(1000);
        userService.saveUser(user);
        //userService.insertUser(user);
        return "useradded";
    }

    @RequestMapping(value = "/users/edit", method = RequestMethod.GET)
    public String getEditPage(@RequestParam(value = "id", required = true) Integer id, Model model) {
        model.addAttribute("userAttribute", userService.findUserById(id));
        return "updateuser";
    }

    @RequestMapping(value = "/users/edit", method = RequestMethod.POST)
    public String update(@ModelAttribute("userAttribute") UserEntity user,
                         @RequestParam(value = "id", required = true) Integer id,
                         Model model) {
        user.setId(id);
        userService.saveUser(user);
        //ormService.updateUser(user.getId(), user.getName(), user.getAge(), user.isAdmin(), user.getCreatedDate());
        model.addAttribute("id", id);
        return "userupdated";
    }

    @RequestMapping(value = "/users/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = true) Integer id, Model model) {
        userService.deleteUser(id);
        model.addAttribute("id", id);
        return "userdeleted";
    }

    @RequestMapping(value = "/users/grid", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public UserGrid listGrid(@RequestParam(value = "page", required = false) Integer page,
                             @RequestParam(value = "rows", required = false) Integer rows,
                             @RequestParam(value = "sidx", required = false) String sortBy,
                             @RequestParam(value = "sord", required = false) String order,
                             @RequestParam(value = "name", required = false) String search) {
        Sort sort = null;
        String orderBy = sortBy;
        if (orderBy != null && orderBy.equals("createdDateString"))
            orderBy = "createdDate";
        if (orderBy != null && order != null) {
            if (order.equals("desc"))
                sort = new Sort(Sort.Direction.DESC, orderBy);
            else
                sort = new Sort(Sort.Direction.ASC, orderBy);
        }
        PageRequest pageRequest;
        if (sort != null)
            pageRequest = new PageRequest(page - 1, rows, sort);
        else
            pageRequest = new PageRequest(page - 1, rows);

        Page<UserEntity> userPage;
        if(search == null) userPage = userService.findAllByPage(pageRequest);
        else userPage = userService.searchByName(search, pageRequest);
        UserGrid userGrid = new UserGrid();
        userGrid.setCurrentPage(userPage.getNumber() + 1);
        userGrid.setTotalPages(userPage.getTotalPages());
        userGrid.setTotalRecords(userPage.getTotalElements());
        //userGrid.setUserData(Lists.newArrayList(userPage.iterator()));
        userGrid.setUserData(userPage.getContent());
        return userGrid;
    }

}
