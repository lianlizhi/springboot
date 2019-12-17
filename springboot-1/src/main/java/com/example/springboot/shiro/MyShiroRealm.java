package com.example.springboot.shiro;

import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.springboot.model.SysMenu;
import com.example.springboot.model.SysRole;
import com.example.springboot.model.SysUser;
import com.example.springboot.service.MenuService;
import com.example.springboot.service.RoleService;
import com.example.springboot.service.UserService;

public class MyShiroRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;

	/** * 授权 * @param principalCollection 身份集合 * @return */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		SysUser user = (SysUser) principalCollection.getPrimaryPrincipal();
		List<SysRole> roles = roleService.getRolesByUserId(user.getUserId());
		List<SysMenu> menus = menuService.getMenusByUserId(user.getUserId());
		simpleAuthorizationInfo.addRoles(roles.stream().map(SysRole::getRoleName).collect(Collectors.toSet()));
		simpleAuthorizationInfo.addStringPermissions(menus.stream().map(SysMenu::getPerms).collect(Collectors.toSet()));
		return simpleAuthorizationInfo;
	}

	/**
	 * * 认证 * @param authenticationToken token * @return * @throws
	 * AuthenticationException
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
			throws AuthenticationException {
		String username = (String) authenticationToken.getPrincipal();
		String password = new String((char[])authenticationToken.getCredentials());
		SysUser user = userService.getUserByUsername(username);
		if (user == null) {
			throw new UnknownAccountException("用户名或密码错误");
		}
		String md5pwd = new Md5Hash(password,username).toHex();
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user, md5pwd,
			ByteSource.Util.bytes(username)	,getName());
		Session session = SecurityUtils.getSubject().getSession();
		session.setAttribute("user", user);
		return simpleAuthenticationInfo;
	}

	/** * 清理缓存权限 */
	public void clearCachedAuthorizationInfo() {
		this.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());

	}
}
