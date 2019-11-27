package com.sxt.sys.vo;

import com.sxt.sys.domain.Permission;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class PermissionVo extends Permission {
    public static final long serialVersionUID = 1L;
    private Integer page=1;
    private Integer limit=10;
}
