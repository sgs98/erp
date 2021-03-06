package com.sxt.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sxt.sys.common.*;
import com.sxt.sys.domain.Permission;
import com.sxt.sys.domain.User;
import com.sxt.sys.service.PermissionService;
import com.sxt.sys.service.RoleService;
import com.sxt.sys.service.UserService;
import com.sxt.sys.vo.PermissionVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * <p>
 *  菜单管理前端控制器
 * </p>
 *
 * @author song
 * @since 2019-11-22
 */
@RestController
@RequestMapping("/menu")
public class MenuController {


    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RoleService roleService;

    @RequestMapping("loadIndexLeftMenuJson")
    public DataGridView loadIndexLeftMenuJson(PermissionVo permissionVo){
        //查询所有菜单
        QueryWrapper<Permission> queryWrapper=new QueryWrapper<>();
        //设置只能查菜单
        queryWrapper.eq("type", Constast.TYPE_MENU);
        queryWrapper.eq("available", Constast.AVAILABLE_TRUE);

        User user = (User) WebUtils.getSession().getAttribute("user");

        List<Permission> list=null;
        if(user.getType()==Constast.USER_TYPE_SUPER){
            list = permissionService.list(queryWrapper);
        }else{

            //根据用户id加角色加权限去查
            Integer userId=user.getId();
            //根据用户id查询角色
            List<Integer> currentUserRoleId = roleService.queryUserRoleIdsByUid(userId);
            //根据角色id查询权限和菜单id   Set去掉重出菜单（set集合中的值不能重复）
            Set<Integer> pids=new HashSet<>();
            for (Integer rid : currentUserRoleId) {
                List<Integer> permissionId = roleService.queryRolePermissionIdsByRid(rid);
                pids.addAll(permissionId);
            }
            //根据角色id查询权限
            if(pids.size()>0){
                queryWrapper.in("id",pids);
                list = permissionService.list(queryWrapper);
            }else{
                list=new ArrayList<>();
            }

        }
        List<TreeNode> treeNodes=new ArrayList<>();
        for (Permission p : list) {
            Integer id= p.getId();
            Integer pid=p.getPid();
            String title=p.getTitle();
            String icon=p.getIcon();
            String href=p.getHref();
            Boolean spread=p.getOpen()== Constast.OPEN_TRUE ?true:false;
            treeNodes.add(new TreeNode(id,pid,title,icon,href,spread));
        }
        List<TreeNode> build = TreeNodeBuilder.build(treeNodes, 1);
        return  new DataGridView(build);
    }



    /*************** 菜单管理开始 ******************/
   

    /**
     * 加载部门管理左边的部门树的json
     */
    @RequestMapping("loadMenuManagerLeftTreeJson")
    public DataGridView loadMenuManagerLeftTreeJson(PermissionVo permissionVo) {
        QueryWrapper<Permission> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("type",Constast.TYPE_MENU);//只能查询菜单
        List<Permission> list = this.permissionService.list(queryWrapper);
        List<TreeNode> treeNodes=new ArrayList<>();
        for (Permission menu : list) {
            Boolean spread=menu.getOpen()==1?true:false;
            treeNodes.add(new TreeNode(menu.getId(), menu.getPid(), menu.getTitle(), spread));
        }
        return new DataGridView(treeNodes);
    }

    /**
     * 查询
     */
    @RequestMapping("loadAllMenu")
    public DataGridView loadAllMenu(PermissionVo permissionVo) {
        IPage<Permission> page=new Page<>(permissionVo.getPage(), permissionVo.getLimit());
        QueryWrapper<Permission> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq(permissionVo.getId()!=null, "id", permissionVo.getId()).or().eq(permissionVo.getId()!=null,"pid", permissionVo.getId());
        queryWrapper.eq("type", Constast.TYPE_MENU);//只能查询菜单
        queryWrapper.like(StringUtils.isNotBlank(permissionVo.getTitle()), "title", permissionVo.getTitle());
        queryWrapper.orderByAsc("ordernum");
        this.permissionService.page(page, queryWrapper);
        return new DataGridView(page.getTotal(), page.getRecords());
    }

    /*
     * 加载最大的排序码
     * */
    @RequestMapping("loadMaxOrderNum")
    public Map<String,Object> loadMaxOrderNum(){
        Map<String,Object> map=new HashMap<String,Object>();

        QueryWrapper<Permission> queryWrapper=new QueryWrapper<>();
        IPage<Permission> page=new Page<>(1,1);
        queryWrapper.orderByDesc("ordernum");

        List<Permission> list = this.permissionService.page(page, queryWrapper).getRecords();
        if (list.size()>0){
            map.put("value",list.get(0).getOrdernum()+1);
        }else {
            map.put("value",1);
        }
        return map;
    }
    /**
     * 添加
     */
    @RequestMapping("addMenu")
    public ResultObj addMenu(PermissionVo permissionVo) {
        try {
            permissionVo.setType(Constast.TYPE_MENU);//设置添加类型
            this.permissionService.save(permissionVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改
     */
    @RequestMapping("updateMenu")
    public ResultObj updateMenu(PermissionVo permissionVo) {
        try {
            this.permissionService.updateById(permissionVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }
    /*
     * 检查当前ID的部门是否有子部门
     * */
    @RequestMapping("checkMenuHasChildrenNode")
    public Map<String,Object> checkMenuHasChildrenNode(PermissionVo permissionVo){
        Map<String,Object> map=new HashMap<String,Object>();
        QueryWrapper<Permission> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("pid",permissionVo.getId());
        List<Permission> list = this.permissionService.list(queryWrapper);
        if (list.size()>0){
            map.put("value",true);
        }else {
            map.put("value",false);
        }
        return map;
    }

    /**
     * 删除
     */
    @RequestMapping("deleteMenu")
    public ResultObj deleteMenu(PermissionVo permissionVo) {
        try {
            this.permissionService.removeById(permissionVo.getId());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /************ 菜单管理结束**************/
     
}

