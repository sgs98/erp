package com.sxt.bus.service;

import com.sxt.bus.domain.Outport;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author song
 * @since 2019-11-26
 */
public interface OutportService extends IService<Outport> {

    /**
     * 退货
     * @param id
     * @param number
     * @param remark
     */
    void addOutPort(Integer id, Integer number, String remark);
}
