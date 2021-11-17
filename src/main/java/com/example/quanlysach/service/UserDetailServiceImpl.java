package com.example.quanlysach.service;

import com.example.quanlysach.dao.ThanhVienDao;
import com.example.quanlysach.model.QuanLy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.Set;

@Service
public class UserDetailServiceImpl implements UserDetailsService {
	private static final Logger log = LoggerFactory.getLogger(UserDetailServiceImpl.class);

	@Autowired
	@Qualifier("quanLyDao")
	private ThanhVienDao thanhVienDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		QuanLy ql = thanhVienDao.getQuanLyTheoTen(username);
		if (ql == null) {
			throw new UsernameNotFoundException("User not found");
		}
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		grantedAuthorities.add(new SimpleGrantedAuthority(ql.getVitri()));
		User user = new User(ql.getUsername(), ql.getPassword(), grantedAuthorities);
		log.info("Login with user@: " + user.getUsername() + ", vitri: " + ql.getVitri());
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		request.setAttribute("userId", ql.getId());
		return user;
	}
}
