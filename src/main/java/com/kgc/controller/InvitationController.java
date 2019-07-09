package com.kgc.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Invitation;
import com.kgc.entity.Replydetail;
import com.kgc.service.InvitationService;
import com.kgc.service.ReplydetailService;
import com.kgc.utils.Param;
import com.kgc.utils.ParamId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/")
public class InvitationController {
    @Autowired
    private InvitationService invitationService;
    @Autowired
    private ReplydetailService replydetailService;

    @RequestMapping("/index")
    public String index(
            @RequestParam(value = "pageIndex",defaultValue = "1")Integer pageIndex,
            @RequestParam(value = "pageSize",defaultValue = "3")Integer pageSize,
            Param param,
            Model model
    ){
        PageInfo<Invitation> info = invitationService.getInvitationByPage(pageIndex, pageSize, param);
        model.addAttribute("param",param);
        model.addAttribute("info",info);
        return "index";
    }

    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public  String delete(@PathVariable("id") Integer id){
        if (invitationService.delateInvitation(id)){
            return "<script>alert('删除成功');location.href='/index'</script>";
        }else {
            return "<script>alert('删除失败');history.go(-1)</script>";
        }
    }

    @RequestMapping(value = "/get/{id}",method = RequestMethod.GET)
    public String get(
            @RequestParam(value = "pageIndex",defaultValue = "1")Integer pageIndex,
            @RequestParam(value = "pageSize",defaultValue = "3")Integer pageSize,
            @PathVariable("id") Integer id,
            Model model
    ){
        PageInfo<Replydetail> info1 = replydetailService.getReplyListById(pageIndex, pageSize, id);
        model.addAttribute("info1",info1);
        return "get";
    }
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add() {
        return "add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String add(Replydetail replydetail) {
        if (replydetailService.addReply(replydetail)) {
            return "<script>alert('添加成功');location.href='/index'</script>";
        } else {
            return "<script>alert('添加失败');history.go(-1)</script>";
        }
    }
}
