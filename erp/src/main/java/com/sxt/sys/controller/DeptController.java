package com.sxt.sys.controller;


import java.util.*;

import com.sxt.sys.common.TreeNode;
import com.sxt.sys.common.WebUtils;
import com.sxt.sys.domain.Dept;
import com.sxt.sys.domain.User;
import com.sxt.sys.vo.DeptVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sxt.sys.common.DataGridView;
import com.sxt.sys.common.ResultObj;
import com.sxt.sys.service.DeptService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author song
 * @since 2019-11-23
 */
@RestController
@RequestMapping("/dept")
public class DeptController {

	@Autowired
	private DeptService deptService;
	
	
	
	/**
	 * 加载部门管理左边的部门树的json
	 */
	@RequestMapping("loadDeptManagerLeftTreeJson")
	public DataGridView loadDeptManagerLeftTreeJson(DeptVo deptVo) {
		List<Dept> list = this.deptService.list();
		List<TreeNode> treeNodes=new ArrayList<>();
		for (Dept dept : list) {
			Boolean spread=dept.getOpen()==1?true:false;
			treeNodes.add(new TreeNode(dept.getId(), dept.getPid(), dept.getTitle(), spread));
		}
		return new DataGridView(treeNodes);
	}

    /**
     * 查询
     */
    @RequestMapping("loadAllDept")
    public DataGridView loadAllDept(DeptVo deptVo) {
        IPage<Dept> page=new Page<>(deptVo.getPage(), deptVo.getLimit());
        QueryWrapper<Dept> queryWrapper=new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(deptVo.getTitle()), "title", deptVo.getTitle());
        queryWrapper.like(StringUtils.isNotBlank(deptVo.getAddress()), "address", deptVo.getAddress());
        queryWrapper.like(StringUtils.isNotBlank(deptVo.getRemark()), "remark", deptVo.getRemark());
        queryWrapper.eq(deptVo.getId()!=null, "id", deptVo.getId()).or().eq(deptVo.getId()!=null,"pid", deptVo.getId());
        queryWrapper.orderByAsc("ordernum");
        this.deptService.page(page, queryWrapper);
        return new DataGridView(page.getTotal(), page.getRecords());
    }

	/*
	* 加载最大的排序码
	* */
	@RequestMapping("loadMaxOrderNum")
    public Map<String,Object> loadMaxOrderNum(){
        Map<String,Object> map=new HashMap<String,Object>();

        QueryWrapper<Dept> queryWrapper=new QueryWrapper<>();
        IPage<Dept> page=new Page<>(1,1);
        queryWrapper.orderByDesc("ordernum");

        List<Dept> list = this.deptService.page(page, queryWrapper).getRecords();
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
    @RequestMapping("addDept")
    public ResultObj addDept(DeptVo deptVo) {
        try {
            deptVo.setCreatetime(new Date());
            this.deptService.save(deptVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改
     */
    @RequestMapping("updateDept")
    public ResultObj updateDept(DeptVo deptVo) {
        try {
            this.deptService.updateById(deptVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }
    /*
    * 检查当前ID的部门是否有子部门
    * */
    @RequestMapping("checkDeptHasChildrenNode")
    public Map<String,Object> checkDeptHasChildrenNode(DeptVo deptVo){
        Map<String,Object> map=new HashMap<String,Object>();

        QueryWrapper<Dept> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("pid",deptVo.getId());
        List<Dept> list = this.deptService.list(queryWrapper);
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
    @RequestMapping("deleteDept")
    public ResultObj deleteDept(DeptVo deptVo) {
        try {
            this.deptService.removeById(deptVo.getId());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
}

