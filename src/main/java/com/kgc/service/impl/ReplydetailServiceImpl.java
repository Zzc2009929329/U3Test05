package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.entity.Invitation;
import com.kgc.entity.Replydetail;
import com.kgc.entity.ReplydetailExample;
import com.kgc.mapper.InvitationMapper;
import com.kgc.mapper.ReplydetailMapper;
import com.kgc.service.ReplydetailService;
import com.kgc.utils.ParamId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ReplydetailServiceImpl  implements ReplydetailService {
    @Autowired
    private ReplydetailMapper replydetailMapper;
    @Autowired
    private InvitationMapper invitationMapper;
    @Override
    public PageInfo<Replydetail> getReplyListById(Integer pageIndex,Integer pageSize,Integer id) {
        PageHelper.startPage(pageIndex,pageSize);
        ReplydetailExample example=new ReplydetailExample();
        ReplydetailExample.Criteria criteria = example.createCriteria();
        if (id!=null&&id!=-1){
                criteria.andInvidEqualTo(id);
        }
        List<Replydetail> list = replydetailMapper.selectByExample(example);
        PageInfo<Replydetail> info1=new PageInfo<>(list,5);
        return info1;
    }

    @Override
    public boolean addReply(Replydetail replydetail) {
        return replydetailMapper.insertSelective(replydetail)>0?true:false;
    }
}
