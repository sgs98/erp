package com.sxt.sys.vo;

import com.sxt.sys.domain.Role;
import com.sxt.sys.domain.User;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserVo extends User {
    public static final long serialVersionUID = 1L;

    private Integer page=1;

    private Integer limit=10;

}
