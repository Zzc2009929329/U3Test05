package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Replydetail;
import com.kgc.utils.ParamId;

import java.util.List;

public interface ReplydetailService {
    PageInfo<Replydetail> getReplyListById(Integer pageIndex, Integer pageSize, Integer id);
    boolean addReply(Replydetail replydetail);
}
