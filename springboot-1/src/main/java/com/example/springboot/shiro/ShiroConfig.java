package com.example.springboot.shiro;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.apache.shiro.mgt.SecurityManager;



//@Configuration
class ShiroConfig {
	public static final String LOGIN_URL = "/login";
	public static final String SUCCESS_URL = "/index";

	/** * 管理bean生命周期 * @return */
	@Bean
	public static LifecycleBeanPostProcessor getLifecycleBeanPostProcessor() {
		return new LifecycleBeanPostProcessor();
	}

	@Bean
	public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager) {
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		shiroFilterFactoryBean.setSecurityManager(securityManager);
		shiroFilterFactoryBean.setLoginUrl(LOGIN_URL);
		shiroFilterFactoryBean.setSuccessUrl(SUCCESS_URL);
		shiroFilterFactoryBean.setUnauthorizedUrl("/403");
		Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
		filterChainDefinitionMap.put("/index", "authc");//代表着前面的url路径，用后面指定的拦截器进行拦截 
		filterChainDefinitionMap.put("/login", "anon");       
		filterChainDefinitionMap.put("/static/**", "anon");       
		filterChainDefinitionMap.put("/sssss", "anon");       
		filterChainDefinitionMap.put("/admin", "roles[admin]");//admin的url，要用角色是admin的才可以登录,对应的拦截器是RolesAuthorizationFilter        
		filterChainDefinitionMap.put("/edit", "perms[edit]");//拥有edit权限的用户才有资格去访问      
		filterChainDefinitionMap.put("/druid/**", "anon");//所有的druid请求，不需要拦截，anon对应的拦截器不会进行拦截        
		filterChainDefinitionMap.put("/**", "user");//所有的路径都拦截，被UserFilter拦截，这里会判断
		
		// 首页 
		//filterChainDefinitionMap.put("/login", "anon");
		 //上两个/login和/ajaxLogin，前后端分离使用，前后端分离中登录界面跳转应由前端路由控制，后台仅返回json数据
		//不使用，shiro控制跳转页面，默认跳转到之前请求页面，跳转successUrl需重写filter
		// filterChainDefinitionMap.put("/*","authc");
		
		shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
		return shiroFilterFactoryBean;
	}

	@Bean
	public SecurityManager securityManager() {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		securityManager.setRealm(myShiroRealm());
		return securityManager;
	}

	@Bean
	public MyShiroRealm myShiroRealm() {
		MyShiroRealm myShiroRealm = new MyShiroRealm();
		myShiroRealm.setCredentialsMatcher(hashedCredentialsMatcher());
		return myShiroRealm;
	}

	/** * 凭证匹配，加密算法 * @return */
	@Bean
	public HashedCredentialsMatcher hashedCredentialsMatcher() {
		HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
		hashedCredentialsMatcher.setHashAlgorithmName("md5");
		//hashedCredentialsMatcher.setHashIterations(2);
		return hashedCredentialsMatcher;
	}

	/** * 开启shiro 注解支持 * @param securityManager * @return */
	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
		AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
		authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
		return authorizationAttributeSourceAdvisor;
	}

	/** * 开启shiro授权注解，若上面Bean未生效则使用此Bean * @return */
	@Bean
	@ConditionalOnMissingBean
	public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
		DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
		advisorAutoProxyCreator.setProxyTargetClass(true);
		return advisorAutoProxyCreator;
	}
}
