package com.buaa.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author theo
 * @time:2016��11��10�� ����2:46:59
 *
 *----------Dragon be here!----------/
 *��������������������
 *���������ߩ��������ߩ�
 *����������������������
 *����������������������
 *���������ש������ס���
 *����������������������
 *�������������ߡ�������
 *����������������������
 *����������������������
 *���������������������ޱ���
 *������������������������BUG��
 *��������������������������
 *�������������������������ǩ�
 *����������������������������
 *�������������������ש�����
 *�������������ϩϡ����ϩ�
 *�������������ߩ������ߩ�
 *---------------���޳�û--------------/
 * 
 */
@Controller
public class AboutMeController {

	@RequestMapping("me")
	public ModelAndView HandleRequest() {
		ModelAndView mv = new ModelAndView("aboutMe");
		return mv;
	}
}
