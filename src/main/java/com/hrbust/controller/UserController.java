package com.hrbust.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;

import com.hrbust.models.Attent;
import com.hrbust.models.User;
import com.hrbust.service.IUserService;
import com.hrbust.tools.FaceRecognizer;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserService userService;

	@RequestMapping("/signin")
	public ModelAndView signin(String imageData, String userID, Map map) {
		// 对字节数组字符串进行Base64解码并生成图片
		ModelAndView mv = new ModelAndView();
		String imgFilePath = "";
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(imageData);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			Date now = new Date();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			// 生成jpeg图片
			imgFilePath = "E:/servers/apache-tomcat-7.0.53/webapps/upload/"
					+ userID + "" + dateFormat.format(now) + "in.jpg";// 新生成的图片
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		new FaceRecognizer().recognizeImage(imgFilePath);

		String ima = FaceRecognizer.personName;
		if (ima!=null&&ima.equals(userID)) {
			userService.signIn(userID);
			map.put("message", "success");
		} else {
			map.put("message", "faild");
		}
		return mv;
	}
	@RequestMapping("/signout")
	public ModelAndView signout(String imageData, String userID, Map map) {
		// 对字节数组字符串进行Base64解码并生成图片
		ModelAndView mv = new ModelAndView();
		String imgFilePath = "";
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(imageData);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			Date now = new Date();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			// 生成jpeg图片
			imgFilePath = "E:/servers/apache-tomcat-7.0.53/webapps/upload/"
					+ userID + "" + dateFormat.format(now) + "out.jpg";// 新生成的图片
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		new FaceRecognizer().recognizeImage(imgFilePath);

		String ima = FaceRecognizer.personName;
		if (ima.equals(userID)) {
			userService.signout(userID);
			map.put("message", "success");
		} else {
			map.put("message", "faild");
		}
		return mv;
	}

	@RequestMapping("/rmain")
	public ModelAndView rmain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Account/register");
		return mv;
	}

	@RequestMapping("/lmain")
	public ModelAndView lmain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Account/login");
		return mv;
	}

	@RequestMapping("/register")
	public ModelAndView register(User user, Map map,
			HttpServletRequest request, MultipartFile pic) {
		ModelAndView mv = new ModelAndView();
		// Add the saved validationForm to the model
		map.put("user", user);
		if (user.getUserID().equals("")) {
			map.put("info", "用户名不能为空");
			return rmain();
		}
		if (user.getPassword().equals("")) {
			map.put("info", "密码不能为空");
			return rmain();
		}
		if (user.getRePassword().equals("")) {
			map.put("info", "确认密码不能为空");
			return rmain();
		}
		if (user.getName().equals("")) {
			map.put("info", "名字不能为空");
			return rmain();
		}

		if (!user.getPassword().equals(user.getRePassword())) {
			map.put("info", "两次输入的密码必须相同");
			return rmain();
		}
		if (userService.selectByPrimaryKey(user.getUserID()) != null) {// 有重复的用户
			map.put("info", "用户已经被注册，请改用其他用户名！");

			return rmain();
		}
		// 保存相对路径到数据库 图片写入服务器
		if (pic == null || pic.isEmpty()) {

			map.put("info", "必须上传头像");
			return rmain();
		}
		// 获取图片的文件名
		String fileName = pic.getOriginalFilename();
		// 获取图片的扩展名
		String extensionName = fileName
				.substring(fileName.lastIndexOf(".") + 1);
		String newFileName = user.getUserID() + "." + extensionName;
		user.setPicpath("/upload/" + newFileName);
		if (userService.addUser(user) > 0) {
			mv.setViewName("Account/login");
			map.put("info", "注册成功");
			saveFile(newFileName, pic);
			return mv;
		} else {
			map.put("info", "注册失败");
			return rmain();
		}

	}

	@RequestMapping("/login")
	public ModelAndView login(@ModelAttribute("user") User user, Model model) {
		ModelAndView mv = new ModelAndView();
		if ((user = userService.login(user)) != null) {
			Attent a=userService.queryAttent(user.getUserID());
			if(a!=null){
				model.addAttribute("signInTime",a.getSignInTime());
				model.addAttribute("signOutTime",a.getSignOutTime());
				model.addAttribute("workDay",a.getWorkDay());
			}
			model.addAttribute("user",user);
			mv.setViewName("main");
		} else {
			model.addAttribute("info", "登录失败");
			mv.setViewName("Account/login");
		}
		return mv;
	}

	private void saveFile(String newFileName, MultipartFile filedata) {
		// TODO Auto-generated method stub
		// 根据配置文件获取服务器图片存放路径
		String picDir = "E:/servers/apache-tomcat-7.0.53/webapps/upload";
		String saveFilePath = picDir;
		/* 构建文件目录 */
		File fileDir = new File(saveFilePath);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}

		try {
			FileOutputStream out = new FileOutputStream(saveFilePath + "\\"
					+ newFileName);
			// 写入文件
			out.write(filedata.getBytes());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
