package nosi.core.webapp.helpers;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 5 Feb 2019
 */
public class CheckBoxHelper {

	private final List<String> chekedIds;
	
	private final List<String> uncheckedIds;
	
	public CheckBoxHelper(String[] array_check,String[] array_check_checked) {
		this.chekedIds = new ArrayList<>();
		this.uncheckedIds = new ArrayList<>();
		try {
			this.extract(array_check,array_check_checked);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<String> getChekedIds() {
		return chekedIds;
	}

	public List<String> getUncheckedIds() {
		return uncheckedIds;
	}
	
	private void extract(String[] array_check,String[] array_check_checked) throws Exception {
		if(Core.isArraySameSize(array_check, array_check_checked)) {
			for(int i=0;i<array_check.length;i++) {
				if(array_check[i].compareTo(array_check_checked[i])==0) {
					this.chekedIds.add(array_check[i]);
				}else {
					this.uncheckedIds.add(array_check[i]);
				}
			}
		}else {
			throw new Exception(Core.gt("Arrays diferentes"));
		}
	}
}
