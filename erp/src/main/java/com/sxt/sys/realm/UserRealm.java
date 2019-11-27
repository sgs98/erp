package com.sxt.sys.realm;

import com.sxt.sys.common.Constast;
import com.sxt.sys.domain.Permission;
import com.sxt.sys.service.PermissionService;
import com.sxt.sys.service.RoleService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sxt.sys.common.ActiverUser;
import com.sxt.sys.domain.User;
import com.sxt.sys.service.UserService;
import org.springframework.context.annotation.Lazy;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class UserRealm extends AuthorizingRealm {

	@Autowired
	@Lazy   //只有使用的时候才会加载
	private UserService userService;

	@Autowired
	@Lazy   //只有使用的时候才会加载
	private PermissionService permissionService;

	@Autowired
    @Lazy
    private RoleService roleService;

	@Override
	public String getName() {
		return this.getClass().getSimpleName();
	}

	/**
	 * 认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		QueryWrapper<User> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("loginname", token.getPrincipal().toString());
		User user = userService.getOne(queryWrapper);
		if (null != user) {
			ActiverUser activerUser = new ActiverUser();
			activerUser.setUser(user);

			//根据用户id查询percode
            //查询所有权限
            QueryWrapper<Permission> qw=new QueryWrapper<>();
            //设置只能查权限
            qw.eq("type", Constast.TYPE_PERMISSION);
            qw.eq("available", Constast.AVAILABLE_TRUE);

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
            List<Permission> list= new ArrayList<>();
            //根据角色id查询权限
            if(pids.size()>0){
                qw.in("id",pids);
                list = permissionService.list(qw);
            }
            //查询的权限放到 activerUser
            List<String> percodes=new ArrayList<>();
            for (Permission permission : list) {
                percodes.add(permission.getPercode());
            }
            //放到
            activerUser.setPermissions(percodes);



            ByteSource credentialsSalt = ByteSource.Util.bytes(user.getSalt());
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(activerUser, user.getPwd(), credentialsSalt,
					this.getName());
			return info;
		}
		return null;
	}

	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        //获取登陆身份
        ActiverUser activerUser= (ActiverUser) principals.getPrimaryPrincipal();

        User user=activerUser.getUser();
        List<String> permissions = activerUser.getPermissions();
        //如果是超级管理员 拥有所有的权限
        if(user.getType()==Constast.USER_TYPE_SUPER){
            authorizationInfo.addStringPermission("*:*");
        }else{
            //否则查询
            if(permissions!=null&&permissions.size()>0){
                authorizationInfo.addStringPermissions(permissions);
            }
        }
        return authorizationInfo;
	}

}
