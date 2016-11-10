package com.sales.erp;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.sales.erp.smember.JoinVO;
import com.sales.erp.smember.SMemberVO;
import com.sales.erp.smemberDao.SMemberDAOImpl;

@Controller
public class JoinController {
	
	@Autowired
	private SMemberDAOImpl sMemberDAOImpl;	
	
	@RequestMapping("/join")	
	public String Join() {		
		return "/join/join";
	}
	
	@RequestMapping("/home")	
	public String home() {		
		return "home";
	}
	
	@RequestMapping(value="/JoinSMember", method=RequestMethod.POST)
	public ModelAndView JoinSMember(JoinVO vo) throws Exception {
		MultipartFile uploadfile = vo.getFile();
        if (uploadfile != null) {
            String fileName = uploadfile.getOriginalFilename();
            try {
                File file = new File("C:/sales/sales/src/main/webapp/resources/portraits/" + fileName);
	            int count = 0;
                while(file.exists()) {           	
	                	int indexes = fileName.lastIndexOf(".");
	                	String extension = fileName.substring(indexes);
	                	String newFileName = fileName.substring(0, indexes) + count + extension;
	                	fileName = newFileName;
	                	file = new File("C:/sales/sales/src/main/webapp/resources/portraits/" + newFileName);
	                	count++;
	                }
	               vo.setPortrait(fileName);
	               uploadfile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
		String year = vo.getYear();
		String month = vo.getMonth();
		String day = vo.getDay();
		String birth = year + "-" + month + "-" + day;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		SMemberVO member = new SMemberVO();
		member.setPwd(vo.getPwd());
		member.setName(vo.getName());
		member.setGender(vo.getGender());
		member.setBirth(sdf.parse(birth));
		member.setAddress(vo.getAddress());
		member.setPhone(vo.getPhone());
		member.setEmail(vo.getEmail());
		member.setAuth("ROLE_EE");
		member.setAccount(vo.getAccount());
		member.setTeam(vo.getTeam());
		member.setPortrait(vo.getPortrait());
		
		sMemberDAOImpl.insertMember(member);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		return mav;
	}
	
}
