package com.kangde.sys.service;

import java.util.List;

import com.kangde.commons.easyui.Combobox;
import com.kangde.commons.service.BaseService;
import com.kangde.sys.dto.EntrustLinKmanDto;
import com.kangde.sys.model.EntrustLinkman;

/**
 *  委托方Service
 * @author zhangyj
 */
public interface EntrustLinkmanService extends BaseService<EntrustLinKmanDto,String>{
	
	List<Combobox> combobox(String entrustNameValue);

}
