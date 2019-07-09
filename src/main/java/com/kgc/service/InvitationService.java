package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Invitation;
import com.kgc.utils.Param;

public interface InvitationService {
    public Invitation getInvitationById(Integer id);
    boolean delateInvitation(Integer id);
    PageInfo<Invitation> getInvitationByPage(Integer pageIndex, Integer pageSize, Param param);
}
