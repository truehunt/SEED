package project.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;


/**
 * @Class Name  : IBSheetUtil.java
 * @Description : IBSheet에서 조회, 저장 요청시 그 처리결과를 json 형태로 반환한다.
 * @Modification Information
 *
 *     수정일                               수정자                  수정내용
 *   --------------------------------------------
 *   2014.05.13       강희상                  최초 생성
 *   2016.12.26       shkim          GetSheetData() 등 메서드 추가
 * @author 공통/통합팀 강희상
 * @since 2014. 05. 13
 * @version 1.0
 * @see
 *
 */
 
 
 
 
@Component("IBSheetUtil")
public class IBSheetUtil {

	
	
	@SuppressWarnings("rawtypes")
	Map<String, Map> itemEtcs = new HashMap<String, Map>();
	Map<String, String> itemEtc = new HashMap<String, String>();
	

	Object Code;
	String CodeMessage;
	Map<String, String> msg = new HashMap<String, String>();
	Object Total;
	Object Data;
	Object Result;

	/**
	 * 생성자
	 */
	public IBSheetUtil(){

	}
	
	/**
	 * 그리드에 표시될 총 레코드 수를 설정한다.
	 * @param total : 총 레코드 수
	 */
	public void setTotal(Object total){
		Total = total;
	}
	/**
	 * 그리드에 제공할 처리결과 코드를 설정한다.
	 * @param code : 코드
	 */
	public void setCode(Object code){
		Code = code;
	}
	
	public void setCode(String sheetName,Object code){
		if(Result==null){
			Map m = new HashMap();
			Map tmp = new HashMap();
			tmp.put("Code", code);
			m.put(sheetName, tmp);
			Result = m;
		}else{
			Map m = (Map)Result;
			Map tmp = new HashMap();
			tmp.put("Code", code);
			m.put(sheetName, tmp);
			Result = m;
		}
	}
	
	/*
	 * 조회/저장 작업에 대한 판단
	 */
	
	/**
	 * code에 따를 설명을 설정한다.
	 * @param message : 메시지 문자열
	 */
	public void setCodeMessage(String message){
		CodeMessage = message;
	}
	
	
	/**
	 * code에 따를 설명을 설정한다.
	 * @param message : 메시지 문자열
	 */
	public void setCodeMessage(String sheetName,String message){
		msg.put(sheetName, message);
	}
	
	
	
	/**
	 * 기타정보를 설정한다.
	 * @param key_name : 키이름
	 * @param key_value : 키값
	 */
	public void setEtc(String key_name, String key_value){
		itemEtc.put(key_name, key_value);
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void setEtc(String sheetName,String key_name, String key_value){
		Object o = itemEtcs.get(sheetName);
		if(o!=null){
			Map etc = (Map)o;
			etc.put(key_name, key_value);
			itemEtcs.put(sheetName, etc);
		}else{
			Map etc = new HashMap();
			etc.put(key_name, key_value);
			itemEtcs.put(sheetName, etc);
		}
	}
	
	public String makeOrderBy(String iborderby){
		String orderbyStr = "";
		String[] colArr = null;
		String[] sortArr = null;
		
		String[] ColandSort = iborderby.split("\\^");
		if(ColandSort[0].indexOf("|")>-1){
			colArr = ColandSort[0].split("\\|");
			sortArr = ColandSort[1].split("\\|");
			for(int i=0;i<colArr.length;i++){
				orderbyStr += ","+colArr[i]+ " " +sortArr[i];
			}
			orderbyStr = orderbyStr.substring(1);
		}else{
			orderbyStr = " "+ColandSort[0]+ " " +ColandSort[1];			
		}
		return orderbyStr;
	}
	
	
	
	
	
	
	/**
	 * doSearch에 대한 결과를 설정한다.
	 * @param data : json 포맷
	 */
	public void setData(Object data){
		Data = data;
	}
	
	
	/**
	 * doSearch에 대한 결과를 설정한다.
	 * @param data : json 포맷
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void setData(String sheetName,Object data){
		if(Data==null){
			Map m = new HashMap();
			m.put(sheetName, data);
			Data = m;
		}else if(Data instanceof java.util.Map) {
			Map m = (Map)Data;
			m.put(sheetName, data);
			Data = m;
		}
	}
	
	
	
	/**
	 * doSave에 대한 결과를 설정한다	
	 * @param result
	 */
	public void setResult(Object result){
		Result = result;
	}

	
	public ModelMap getSearchJSON(){
		ModelMap model = new ModelMap();
		return getSearchJSON(model);
	}

	
	/**
	 * IBSheet에 전달된 결과 데이터를 반환한다
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ModelMap getSearchJSON(ModelMap model){
		
		

		//여러개 시트 
		if(Data instanceof java.util.Map){
			Map m = (Map)Data;
			Iterator it = m.keySet().iterator();
			
			while(it.hasNext()){
				String key = (String)it.next();
				Map rtnMap = new HashMap();
				if(itemEtcs.get(key)!=null) rtnMap.put("Etc",itemEtcs.get(key) );
				if(msg.get(key)!=null) rtnMap.put("Message", msg.get(key));
				rtnMap.put("Data", m.get(key));
				model.addAttribute(key,rtnMap);
			}
		}else{
			if(Total!=null){
				model.addAttribute("Total",Total);
			}
			
			//단건 시트
			if(itemEtc.size() > 0) model.addAttribute("Etc", itemEtc);
			model.addAttribute("Message", CodeMessage);
			model.addAttribute("Data", Data);
		}
		return model;
	}
	public ModelMap getSaveJSON(){
		ModelMap model = new ModelMap();
		return getSaveJSON(model);
	}
	public ModelMap getSaveJSON(ModelMap model){
		
		if(Result instanceof java.util.Map){
			Map m = (Map)Result;
			Iterator it = m.keySet().iterator();
			
			while(it.hasNext()){
				String key = (String)it.next();
				Map rtnMap = new HashMap();
				if(itemEtcs.get(key)!=null) rtnMap.put("Etc",itemEtcs.get(key) );
				if(msg.get(key)!=null) rtnMap.put("Message", msg.get(key));
				rtnMap.put("Result", m.get(key));
				model.addAttribute(key,rtnMap);
			}
		}else{
			
			Map<String, Object> itemResult = new HashMap<String, Object>();
			
			itemResult.put("Code",  Code);
			itemResult.put("Message", CodeMessage);
			model.addAttribute("Result", itemResult);
			if(itemEtc.size() > 0) model.addAttribute("Etc", itemEtc);
		}
		return model;
	}

	/*
	 * 멀티체크 컬럼의 데이터를 맵에 옮겨 담는다.
	 */
	public Map<String,Object> setMultiCheckData(Map<String,Object> rowmap,String saveName){
		
		if(rowmap.get(saveName)!=null){
			String multicheck =	(String)rowmap.get(saveName);
			String[] items = multicheck.split("\\|",-1);
			for(int i=0;i<items.length;i++){
				String[] item = items[i].split(":",-1);
				if("1".equals(item[1])){
					rowmap.put(item[0],item[1]);
				}
			}
		}
		return rowmap;
	}
	
	
	/**
	 * IBSheet에서 전달된 데이터를 Map에 담는다. 
	 * @param commandMap
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> getSheetData(String sheetName,Map reqMap) throws Exception{
		List<Map> rtnList = new ArrayList();
		boolean isMulti = true;
		try{
			String sheetSaveName = (String)reqMap.get(sheetName+"_SAVENAME");
			String[] arrSaveName = sheetSaveName.split("\\|",-1);
			String[] arrSaveName2 = new String[arrSaveName.length];
			
			if(isMulti){
				for(int i=0;i<arrSaveName.length;i++){
					arrSaveName2[i] = arrSaveName[i];
					arrSaveName[i] = sheetName+"_"+arrSaveName[i];
				}
			}
			
			
			Map<String,String[]> data = new HashMap();
			
			//저장 건수
			if(reqMap.get(arrSaveName[0])==null){
				return rtnList;
			}
			String tempData = reqMap.get(arrSaveName[0])+"";
			
			
 			int itemCnt = (tempData.split("‡",-1)).length;
			
			
			//넘어온 데이터를 배열에 담는다.
			for(int i=0;i<arrSaveName.length;i++){
				//저장 건수
				data.put(arrSaveName[i],  (reqMap.get(arrSaveName[i])+"").split("‡",-1));
			}
			
			
			
			//데이터를 피벗시킴
			Map<String,String> row = null;
			for(int ic=0;ic<itemCnt;ic++){
				row = new HashMap();
				for(int i=0;i<arrSaveName.length;i++){
					String[] t = (String[])data.get(arrSaveName[i]);
					if(isMulti){
						row.put(arrSaveName2[i]  ,t[ic]);
					}else{
						row.put(arrSaveName[i]  ,t[ic]);
					}
				}
				rtnList.add(row);
			}
			
			
		}catch(Exception ex){
			ex.printStackTrace();
			throw new Exception("error occur From IBSheetUtil(getSheetData) :\n"+ex.getMessage());
		}
		return rtnList;
	}
	
	//Role = "I|U|D"
	@SuppressWarnings({ "unchecked", "unused" })
	public boolean checkStatus(HttpServletRequest req,String Role){
		Enumeration<String> en =req.getParameterNames();
		while(en.hasMoreElements()){
			String key = en.nextElement();
			if(key.indexOf("_SAVENAME")>-1){
				String savename = req.getParameter(key);
				String[] savenames = savename.split("\\|",-1);
				for(int i=0;i<savenames.length;i++){
					if((savenames[i].toLowerCase()).indexOf("status")>-1){
						String rowStatus = req.getParameter(savenames[i]);
						
					}
				}
				
			}
		}
		
		
		return true;
	}
	
	
	/**
	 * IBSheet에서 전달된 데이터를 Map에 담는다. 
	 * @param commandMap
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> getParam(Map commandMap){
		List<Map> itemList = new ArrayList<Map>();

		//SYS_SAVENAME 정보를 가져온다.
		String SYS_SAVENAME = (String)commandMap.get("SYS_SAVENAME");
		String[] arrSaveName = SYS_SAVENAME.split("\\|");
		
		//SYS_SAVENAME에 없는 필드명을 가져온다.
		StringBuffer ETC_NAME = new StringBuffer();
		ETC_NAME.append("SYS_");
		
		boolean bCheck = false;
		
		final Enumeration<String> strEnum = Collections.enumeration(commandMap.keySet());
		while(strEnum.hasMoreElements()) {
			String strElement = strEnum.nextElement();
			if(!"SYS_SAVENAME".equals(strElement) && !"-".equals(strElement)){
				bCheck = false;
				for(int i=0;i<arrSaveName.length;i++){
					if(strElement.equals(arrSaveName[i])){
						bCheck = true;
						break;
					}
				}
				if(!bCheck){
					ETC_NAME.append("|").append(strElement);
				}
			}
		}
		String[] arrEtcName = null;
		if(ETC_NAME.length()>0 && !"SYS_".equals(ETC_NAME.toString())) arrEtcName = ETC_NAME.toString().split("\\|");
		
		//반환할 레코드 목록 작성
    	if(commandMap.get("STATUS") instanceof String[]){
    		//배열
    		HashMap<String, Object> items = new HashMap<String, Object>();
    		
    		for(int i=0;i<arrSaveName.length;i++){
    			items.put(arrSaveName[i], (String[])commandMap.get(arrSaveName[i]));
    		}

    		int rows = ((String[])items.get("STATUS")).length;
    		for(int i=0;i<rows;i++){
    			Map<String, String> item = new HashMap<String, String>();
    			for(int j=0;j<arrSaveName.length;j++){
    				item.put(arrSaveName[j], ((String[])items.get(arrSaveName[j]))[i]);
    			}

       	    	//사용자 추가 변수 처리
       			if(arrEtcName!=null){
	    			HashMap<String, Object> etcItems = new HashMap<String, Object>();
	        		for(int j=1;j<arrEtcName.length;j++){
	        			etcItems.put(arrEtcName[j], (String)commandMap.get(arrEtcName[j]));
	        		}
	       			for(int j=1;j<arrEtcName.length;j++){
	       				item.put(arrEtcName[j], ((String)etcItems.get(arrEtcName[j])));
	       			}
       			}
       			
    			itemList.add(item);
    		}
    	}else{
    		//단건
    		HashMap<String, Object> items = new HashMap<String, Object>();
    		for(int i=0;i<arrSaveName.length;i++){
    			items.put(arrSaveName[i], (String)commandMap.get(arrSaveName[i]));
    		}
   			Map<String, String> item = new HashMap<String, String>();
   			for(int j=0;j<arrSaveName.length;j++){
   				item.put(arrSaveName[j], ((String)items.get(arrSaveName[j])));
   			}
   		
   	    	//사용자 추가 변수 처리
   			if(arrEtcName!=null){
   				HashMap<String, Object> etcItems = new HashMap<String, Object>();
    			for(int i=1;i<arrEtcName.length;i++){
    				etcItems.put(arrEtcName[i], (String)commandMap.get(arrEtcName[i]));
    			}
   				for(int j=1;j<arrEtcName.length;j++){
   					item.put(arrEtcName[j], ((String)etcItems.get(arrEtcName[j])));
   				}
   			}

   			itemList.add(item);
    	}

    	return itemList;
	}
	
	
   @SuppressWarnings("rawtypes")
   public static void mapPrint(Map mp) throws Exception{

    	String key = "";
    	Iterator it = mp.keySet().iterator();
    	while(it.hasNext()){
    		key = (String)it.next();
    		System.out.println("Map Print>>>>>   key:"+key+" value:"+mp.get(key)+" type:"+mp.get(key).getClass().getName());
    	}
    	System.out.println("\n\n\n\n");

    }
   
    public static void enumPrint(Enumeration<String> en) throws Exception{
    	String key = "";
    	while(en.hasMoreElements()){
    		key = en.nextElement();
    		System.out.println("Enum Print>>>>>   "+key);
    	}
    }

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ModelMap getChartJSON(Map map) {
		ModelMap model = new ModelMap();
		float gv=0;
		boolean useGuidline = false;
		String guidelineUnderPointColor = "#FF0000";
		String[] value = (map.get("value")+"").split("\\|");
		String[] seriesname = null;
		if(map.get("seriesname")!=null){
			seriesname = (map.get("seriesname")+"").split("\\|");
		}
		
		
		String axisLabel = map.get("axislabel")+"";
		boolean hasAxisLabel = (!("".equals(axisLabel)));
		
		if(map.get("guidelineValue")!=null){
			gv = Float.parseFloat(map.get("guidelineValue")+"");
			if(map.get("guidelineUnderPointColor")!=null){
				guidelineUnderPointColor = map.get("guidelineUnderPointColor")+""; 
			}
			useGuidline = true;
		}
		List rows = new ArrayList();
		List li = (List)Data;
		for(int i=0;i<li.size();i++){
			Map row = new HashMap();
			Map m = (Map)li.get(i);
			
			if(hasAxisLabel){
				row.put("axisLabel", m.get(axisLabel));
			}
			ArrayList series = new ArrayList();

			if(i==0){
				for(int c=0;c<value.length;c++){
					Map first = new HashMap();
					
					float v =  Float.parseFloat(m.get(value[c])+"");
					if(useGuidline&&v<gv){
						first.put("pointColor", guidelineUnderPointColor);
					}
					
					first.put("Value",v);
					
					
					if(seriesname!=null){
						first.put("seriesName", seriesname[c]);
					}
					series.add(first);	
				}
			}else{
				for(int c=0;c<value.length;c++){
					float v = Float.parseFloat(m.get(value[c])+"");
					if(useGuidline&&v<gv){
						Map mp = new HashMap();
						mp.put("value", v);
						mp.put("pointColor", guidelineUnderPointColor);
						series.add(mp);
					}else{
						series.add(v);	
					}
					
				}
			}
			row.put("series", series);
			rows.add(row);
		}
		
		
		Map ibchart = new HashMap();
		ibchart.put("data", rows);
		model.put("ibchart",ibchart);
		return model;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ModelMap sessionClose(){
		Map resultMap = new HashMap();
		resultMap.put("Code", "-300");
		resultMap.put("Message", "세션이 종료 되었습니다.");
		
		ModelMap model = new ModelMap();
		model.addAttribute("Result",resultMap);
		return model;
	}
	
	/**
	 * IBSheet에서 전달된 ORDER BY PARAM(camel,멤버변수명) 정보를 DB컬럼명 스타일로 변환한다.
	 * @param str
	 * @return value
	 */

	public String camelToDbStyle(String str)
	{
		String regex = "([a-z])([A-Z])";
		String replacement = "$1_$2";
        String value = "";

        value = str.replaceAll(regex, replacement).toUpperCase();

        return value;

	}
	
	/**
	 * IBSheet init 정보를 생성한다.
	 * @param data, initType
	 * @return itemList
	 */
	public String jsonString(List<Map<String, Object>> data, String initType){		
		StringBuffer itemList = new StringBuffer();
		StringBuffer etcList = new StringBuffer();

		int index=0;

		for (Map<String, Object> map : data){

			if(initType.equals("Cols")){
				if(index == 0) itemList.append("[\r\n");
				else itemList.append(",\r\n");
			}
			
			String[] etcItem;
			String[] etcData;
			
			int itemIndex = 0;
			int totalIndex = 0;
			
			for(Map.Entry<String, Object> entry : map.entrySet()){
				if(totalIndex == 0)itemList.append("{");
				
				if(!entry.getValue().equals("null") && !entry.getValue().equals("")){
					String key = entry.getKey();
					Object value = entry.getValue();
					
					/* etcData 생성 */
					if(key.equals("EtcData") && initType.equals("Cfg")){
						etcItem = ((String) value).split("‡");
						
						for(int i=0; i<etcItem.length; i++){
							etcData = etcItem[i].split("=");
							if(i == 0) etcList.append(etcData[0] + ":" + '"'+etcData[1]+'"');
							else etcList.append(", " + etcData[0] + ":" + '"'+etcData[1]+'"');
						}
					}
					/* etcData 생성 끝 */
					
					if(!key.equals("EtcData")){
						if(itemIndex == 0) itemList.append(key + ":" + '"'+value+'"');
						else itemList.append(", "+key + ":" + '"'+value+'"');
					}
					
					itemIndex++;
				}
				totalIndex++;
								
				if(map.size() == totalIndex){
					//etcData가 있으면 마지막에 추가
					if(!etcList.toString().equals("") && initType.equals("Cfg")){
						if(totalIndex == 0) itemList.append(etcList);
						else itemList.append(", "+etcList);
					}
					
					itemList.append("}");
				}
			}
			index++;
			
			if(initType.equals("Cols")){
				if(data.size() == index) itemList.append("\r\n]");
			}
		}

		System.out.println("itemList:"+itemList.toString());
		
		return itemList.toString();
	}
	
	
	//임시(사용안함)
	public String getInitInfo(Object obj){
		StringBuffer initInfo = new StringBuffer();
		
		String itemList = "";
		String[] item;
		int index  = 0;
		
		itemList = obj.toString().replaceAll("\\{", "");
		itemList = itemList.replaceAll("\\}", "");
		itemList = itemList.replaceAll("\\[", "");
		itemList = itemList.replaceAll("\\]", "");
		
		item = itemList.split(",");

		for(int i=0; i<item.length; i++){
			
			index = item[i].indexOf("=");
			
			item[i] = item[i].substring(index+1,item[i].length());
					
			//첫번째 행이면
			if(i % 2 == 0 && i == 0){
				initInfo.append(item[i]+":");
			}else if(i % 2 == 0 && i != 0){
				initInfo.append(", "+item[i]+":");
			}else{
				initInfo.append(item[i]);
			}
		}
		
		return initInfo.toString();
	}
	
	//임시(사용안함)
	public String makeCols(String initColumns){
		String columnStr = "";
		String[] colArr = null;
		
		colArr = initColumns.split("\\|");
	
		
		for(int i=0;i<colArr.length;i++){
			if(i == 0){
				columnStr = camelToDbStyle(colArr[i]);
			}else{
				columnStr += ","+camelToDbStyle(colArr[i]);
			}
		}
		
		return columnStr;
	}
	
	//임시(사용안함)
	public String jsonReplace(Object obj){		
		String itemList = "";
		
		itemList = obj.toString().replaceAll("\\{", "");
		itemList = itemList.replaceAll("\\}", "");
		itemList = itemList.replaceAll("\\[", "");
		itemList = itemList.replaceAll("\\]", "");
		
		return itemList;
	}

}

