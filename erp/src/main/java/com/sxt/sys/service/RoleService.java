package com.sxt.sys.service;

import com.sxt.sys.domain.Role;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author song
 * @since 2019-11-24
 */
public interface RoleService extends IService<Role> {

    /**
     * 根据角色id查询当前角色拥有的权限或菜单的ID
     * @param roleId
     * @return
     */
    List<Integer> queryRolePermissionIdsByRid(Integer roleId);


    /**
     * 保存角色和菜单权限之间的关系
     * @param roleId
     * @param ids
     */
    void saveRolePermission(Integer roleId, Integer[] ids);


    /**
     * 查询当前用户拥有的角色id集合
     * @param id
     * @return
     */
    List<Integer> queryUserRoleIdsByUid(Integer id);
}
