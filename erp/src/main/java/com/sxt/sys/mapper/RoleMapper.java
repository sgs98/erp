package com.sxt.sys.mapper;

import com.sxt.sys.domain.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;


/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author song
 * @since 2019-11-24
 */
public interface RoleMapper extends BaseMapper<Role> {


    /**
     * 根据角色ID删除sys_role_permission
     * @param id
     */
    void deleteRolePermissionByRid(Serializable id);


    /**
     * 根据角色ID删除sys_role_user
     * @param id
     */
    void deleteRoleUserByRid(Serializable id);


    /**
     * 根据角色ID查询当前角色拥有的所有的权限或菜单ID
     * @param roleId
     * @return
     */
    List<Integer> queryRolePermissionIdsByRid(Integer roleId);


    /**
     * 保存角色和菜单权限之间的关系
     * @param rid
     * @param pid
     */
    void saveRolePermission(@Param("rid")Integer rid, @Param("pid")Integer pid);


    /**
     * 根据用户ID删除用户角色中间表的数据
     * @param id
     */
    void deleteRoleUserByRUid(@Param("id") Serializable id);


    /**
     * 查询当前用户拥有的角色id集合
     * @param id
     * @return
     */
    List<Integer> queryUserRoleIdsByUid(Integer id);


    /**
     * 保存用户和角色之间的关系
     * @param uid
     * @param rid
     */

    void insertUserRole(@Param("uid")Integer uid, @Param("rid")Integer rid);
}
