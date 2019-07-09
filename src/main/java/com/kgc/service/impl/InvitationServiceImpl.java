package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.entity.Invitation;
import com.kgc.entity.InvitationExample;
import com.kgc.mapper.InvitationMapper;
import com.kgc.service.InvitationService;
import com.kgc.utils.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvitationServiceImpl implements InvitationService {
    @Autowired
    private InvitationMapper invitationMapper;
    @Override
    public Invitation getInvitationById(Integer id) {
        return invitationMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean delateInvitation(Integer id) {
        return invitationMapper.deleteByPrimaryKey(id)>0?true:false;
    }

    @Override
    public PageInfo<Invitation> getInvitationByPage(Integer pageIndex, Integer pageSize, Param param) {
        PageHelper.startPage(pageIndex,pageSize);
        InvitationExample example=new InvitationExample();
        InvitationExample.Criteria criteria = example.createCriteria();
        if (param!=null){
            if (param.getTitle()!=null&&!param.getTitle().equals("")){
                criteria.andTitleLike("%"+param.getTitle()+"%");
            }
        }
        List<Invitation> list = invitationMapper.selectByExample(example);
        PageInfo<Invitation> info=new PageInfo<>(list,5);
        return info;
    }
}
